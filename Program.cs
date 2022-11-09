using System;
using System.IO;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Linq;
using System.Data;
using System.Text;

namespace Arc4
{
    class Program
    {
        static void Main(string[] args)
        {
            Arc arc = new Arc();
            arc.main(true);

            Console.ReadKey();
        }
    }
    class Arc
    {
        public Dictionary<string, string> loc = new Dictionary<string, string>();
        public Dictionary<string, string> mod = new Dictionary<string, string>();
        string directory;
        public void writeMod(string key, string modifiers)
        {
            if(mod.ContainsKey(key))
                mod[key] = modifiers;
            else
                mod.Add(key, modifiers);
        }
        public void writeLoc(string key, string text)
        {
            if(loc.ContainsKey(key))
                loc[key] = text;
            else
                loc.Add(key, text);
        }
        private void readLoc()
        {
            if (!File.Exists(directory + "\\localisation\\english\\arc_l_english.yml"))
                File.Create(directory + "\\localisation\\english\\arc_l_english.yml").Dispose();
            string[] loca = File.ReadAllLines(directory + "\\localisation\\english\\arc_l_english.yml");
            for(int i = 0; i < loca.Length; i++)
            {
                Match match = Regex.Match(loca[i], "([A-Za-z0-9_.-]+): +\"([^\"]*)\"");
                if(match.Success)
                    loc.Add(match.Groups[1].Value,'\"'+match.Groups[2].Value+'\"');
            }
        }
        private void readMod()
        {
            if (!File.Exists(directory + "\\common\\event_modifiers\\arc.txt"))
                File.Create(directory + "\\common\\event_modifiers\\arc.txt").Dispose();
            string[] loca = File.ReadAllLines(directory + "\\common\\event_modifiers\\arc.txt");
            for(int i = 0; i < loca.Length; i++)
            {
                Match match = Regex.Match(loca[i], "^([^ ]+) *= *{ *([^}]+) *}", RegexOptions.Multiline);
                if(match.Success)
                    mod.Add(match.Groups[1].Value, match.Groups[2].Value);
            }
        }
        private void saveMod()
        {
            if (!File.Exists(directory + "\\common\\event_modifiers\\arc.txt"))
                File.Create(directory + "\\common\\event_modifiers\\arc.txt").Dispose();
            List<string> loca = new List<string>();
            for (int i = 0; i < mod.Count; i++)
            {
                loca.Add(mod.Keys.ElementAt(i) + " = { \n \t" + mod.Values.ElementAt(i) + "\n } \n");
            }
            string loca2 = "";
            for (int i = 0; i < loca.Count; i++)
            {
                loca2 += loca[i] + "\n";
            }
            File.WriteAllText(directory + "\\common\\event_modifiers\\arc.txt", loca2);
        }
        private void saveLoc()
        {
            if (!File.Exists(directory + "\\localisation\\english\\arc_l_english.yml"))
                File.Create(directory + "\\localisation\\english\\arc_l_english.yml").Dispose();
            List<string> loca = new List<string>();
            loca.Add("l_english:");
            for(int i = 0; i < loc.Count; i++)
            {
                loca.Add(" " + loc.Keys.ElementAt(i) + ": " + loc.Values.ElementAt(i));
            }
            string loca2 = "";
            for(int i = 0; i < loca.Count; i++)
            {
                loca2 += loca[i] + "\n";
            }
            File.WriteAllText(directory + "\\localisation\\english\\arc_l_english.yml", ConvertStringToUtf8Bom(loca2));

            string ConvertStringToUtf8Bom(string source)
            {
                var data = Encoding.UTF8.GetBytes(source);
                var result = Encoding.UTF8.GetPreamble().Concat(data).ToArray();
                var encoder = new UTF8Encoding(true);

                return encoder.GetString(result);
            }
        }
        public void main(bool syntax)
        {
            directory = Directory.GetCurrentDirectory();
            readLoc();
            readMod();
            LoadFolder(directory);

            void LoadFolder(string start)
            {
                string[] folder = Directory.GetDirectories(start);
                for (int i = 0; i < folder.Length; i++)
                    LoadFolder(folder[i]);

                string[] files = Directory.GetFiles(start);
                for (int i = 0; i < files.Length; i++)
                    if (files[i].EndsWith(".arc"))
                    {   try
                        {
                            if(syntax)
                                File.WriteAllText(files[i].Substring(0, files[i].Length - 4) + ".txt",
                                    new Compiler(directory, this).compile(
                                        Regex.Replace(File.ReadAllText(files[i]), "#.*", "")
                                            .Replace("\n", " \\n ")
                                            .Replace("\t", " \\t ")
                                    )
                                );
                            else
                                File.WriteAllText(files[i].Substring(0, files[i].Length - 4) + ".txt",
                                    new Compiler(directory, this).compile(
                                        Regex.Replace(File.ReadAllText(files[i]), "#.*", "")
                                    )
                                );
                            Console.WriteLine("Transpiled " + files[i]);
                        }
                        catch (Exception e) { Console.WriteLine(e.Message + " at " + files[i]); };
                    }
            }
            saveLoc();
            saveMod();
        }
    }
    class Compiler
    {
        Dictionary<string, string> variables = new Dictionary<string, string>();
        Dictionary<string, Dictionary<string, Dictionary<string, string>>> classes = new Dictionary<string, Dictionary<string, Dictionary<string, string>>>();
        string directory;
        List<string> multiscope = new List<string>();
        List<string> currentscope = new List<string>();
        Arc owner;
        private void setVar(string key, string value)
        {
            if (variables.ContainsKey(key))
                variables[key] = value;
            else
                variables.Add(key, value);
        }
        public Compiler(string directory, Arc owner)
        {
            this.directory = directory;
            this.owner = owner;
        }
        public string compile(string file)
        {
            return low_compile(ParseString(file));
        }
        public string low_compile(string[] code)
        {
            string result = "";
            for (int i = 0; i < code.Length; i++)
            {
                string g = code[i];
                switch (g)
                {
                    case "\\t": result += "\t"; break;
                    case "\\n": result += "\n"; break;
                    case "arc_modifier":
                        result += arc_modifier(i, out i);
                        break;
                    case "var":
                        i = arc_variable(i);
                        break;
                    case string s when Regex.IsMatch(s, "[^,],"):
                        multiscope.Add(s.Substring(0,s.Length-1));
                            if (currentscope.Count == 0 || currentscope[0] != "multiscope")
                                currentscope.Insert(0, "multiscope");
                        break;
                    case string s when Regex.IsMatch(s, "\\([^()]+\\)"):
                        result += arc_math(Regex.Match(Regex.Match(s, "\\([^()]+\\)").Value, "[^()]+").Value);
                        break;
                    case string s when g.ToLower() == "defineloc":
                        i = arc_defineloc(i);
                        break;
                    case "for":
                        result += arc_for(i, out i);
                        break;
                    case "using": i = arc_using(i); break;
                    case "foreach": i = arc_foreach(i); break;
                    case string s when Regex.IsMatch(s, "([^.]+)\\.([^.]+)\\.([^.]+)") && classes.ContainsKey(Regex.Match(s, "[^.]+").Value):
                        i = arc_class(i);
                        break;
                    case string s when variables.ContainsKey(s):
                        result += variables[s];
                        break;
                    case string s when currentscope.Count > 0:
                        switch (currentscope[0])
                        {
                            case "multiscope":
                                result += arc_multiscope(g, i, out i);
                                break;
                        }
                        break;
                    default:
                        result += g + " ";
                        break;
                }
            }
            string arc_modifier(int a, out int i)
            {
                        i = a;
                i++;    while(!expect(code,i,"=")) { i++; }
                i++;    while(!expect(code,i,"{")) { i++; }
                i++;    while(!expect(code,i,"id")) { i++; }
                i++;    while(!expect(code,i,"=")) { i++; }
                i++;    string id = code[i];
                i++;    while (!expect(code, i, "type")) { i++; }
                i++;    while (!expect(code, i, "=")) { i++; }
                i++;    string type = Regex.Match(code[i],"[^(]+").Value;
                        string duration = arc_math(Regex.Match(code[i],"\\([^()]*\\)").Value);
                        if (duration == "") duration = "-1";
                i++;    while (!expect(code, i, "name")) { i++; }
                i++;    while (!expect(code, i, "=")) { i++; }
                i++;    string name = code[i];
                i++;    while (!expect(code, i, "desc")) { i++; }
                i++;    while (!expect(code, i, "=")) { i++; }
                i++;    string desc = code[i];
                i++;    while (!expect(code, i, "modifiers")) { i++; }
                i++;    while (!expect(code, i, "=")) { i++; }
                i++;    while (!expect(code, i, "{")) { i++; }
                i++;    string modifiers = code[i];
                i++;    while (!expect(code, i, "}")) { i++; }
                i++;    while (!expect(code, i, "}")) { i++; }
                        owner.writeLoc(id, name);
                        owner.writeLoc(id + "_desc", desc);
                        owner.writeMod(id, modifiers);
                        return "add_" + type + "_modifier = { name = " + id + " duration = " + duration + " desc = " + id + "_desc hidden = no } "; 
            }
            int arc_variable(int i)
            {
                i++; string varname = code[i];
                i++; while (!expect(code, i, "=")) { i++; }
                i++; string varvalue = code[i];
                if (varvalue.Contains("("))
                        varvalue = arc_math(Regex.Match(varvalue,"\\(.*\\)").Value);
                setVar(varname, varvalue);
                return i++;
            }
            string arc_for(int a, out int i)
            {
                i = a;
                i++; string varname = code[i];
                i++; while (!expect(code, i, "=")) { i++; }
                i++; int start = int.Parse(code[i]);
                i++; while (!expect(code, i, "to")) { i++; }
                i++; int end = int.Parse(code[i]);
                i++; while (!expect(code, i, "=")) { i++; }
                i++; while (!expect(code, i, "{")) { i++; }
                i++;
                int indent = 1;
                List<string> loop = new List<string>();

                while(indent > 0)
                {
                    string g = code[i];
                    switch (g)
                    {
                        case "{":
                            indent++;
                            loop.Add("{");
                            break;
                        case "}":
                            indent--;
                            if(indent > 0)
                                loop.Add("}");
                            break;
                        default:
                            loop.Add(g);
                            break;
                    }
                    i++;
                }

                List<string> final = new List<string>();

                for (int j = start; j <= end; j = towards(j, away(end, start)))
                {
                    final.Add("var");
                    final.Add(varname);
                    final.Add("=");
                    final.Add(j.ToString());
                    for (int h = 0; h < loop.Count; h++)
                        final.Add(loop[h]);
                }

                return low_compile(final.ToArray());

                int towards(int v, int o)
                {
                    if (v > o)
                        return v - 1;
                    if (v < o)
                        return v + 1;
                    else
                        return v;
                }
                int away(int v, int o)
                {
                    if (v < o)
                        return v - 1;
                    if (v > o)
                        return v + 1;
                    else
                        return v;
                }
            }
            int arc_defineloc(int i)
            {
                i++; string key = code[i];
                i++; i++; string value = code[i];
                owner.writeLoc(key, value);
                return i;
            }
            string arc_multiscope(string g, int a, out int i)
            {
                i = a;
                currentscope.RemoveAt(0);
                multiscope.Add(g);
                List<string> effect = new List<string>();
                while(g != "}")
                {
                    i++; g = code[i];
                    effect.Add(g);
                }
                effect.Add("\\n");
                string[] newcode = new string[(effect.Count + 1) * multiscope.Count];
                for(int j = 0; j < multiscope.Count; j++)
                {
                   newcode[j*(effect.Count+1)] = multiscope[j];
                    for(int k = 0; k < effect.Count; k++) { 
                        newcode[k + (j*(effect.Count+1))+1] = effect[k];
                    };
                }
                multiscope.Clear();
                return low_compile(newcode);
            }
            string arc_math(string expression)
            {
                if (expression == "")
                    return "";
                expression = expression.Replace(" ", "");
                MatchCollection matches = new Regex("([^ .]+)\\.([^.]+)\\.([^. +/*-]+)").Matches(expression);
                for (int i = 0; i < matches.Count; i++)
                    expression = Regex.Replace(expression, matches[i].Value, classes[matches[i].Groups[1].Value][matches[i].Groups[2].Value][matches[i].Groups[3].Value]);
                matches = new Regex("([^()0-9.*+/-]+)").Matches(expression);
                for (int i = 0; i < matches.Count; i++)
                    expression = Regex.Replace(expression, matches[i].Value, variables[matches[i].Groups[1].Value]);
                return Regex.Match(new DataTable().Compute(expression, "").ToString(),"[^.]+").Value;
            }
            int arc_foreach(int i)
            {
                i++;
                string currentClass = code[i];
                i++;
                while (!expect(code, i, "=")) { i++; }
                i++;
                while (!expect(code, i, "{")) { i++; }
                int g = 0;
                int indent = 1;

                List<string> loop = new List<string>();

                i++;
                while (indent > 0)
                {
                    indent += Regex.Matches(code[i + g], "{").Count;
                    indent -= Regex.Matches(code[i + g], "}").Count;
                    if (indent > 0) loop.Add(code[i + g]);
                    g++;
                }

                List<string> ForEach = new List<string>();

                for (int z = 0; z < i; z++)
                    ForEach.Add(code[z]);

                for (int z = 0; z < classes[currentClass].Count; z++)
                {
                    for (int b = 0; b < loop.Count; b++)
                    {
                        if (Regex.Match(loop[b], currentClass + "(\\..+)+").Success)
                        {
                            string var = Regex.Match(loop[b], "[^.0-9*/+-]+").NextMatch().Value;
                            ForEach.Add(Regex.Replace(loop[b], currentClass + "\\." + var, classes[currentClass].ElementAt(z).Value[var]));
                        }
                        else
                            ForEach.Add(loop[b]);
                    }
                }

                for (int c = i + loop.Count + 1; c < code.Length; c++)
                {
                    ForEach.Add(code[c]);
                }

                code = ForEach.ToArray();
                i--;

                return i;
            }

            int arc_class(int i)
            {
                MatchCollection matches = Regex.Matches(code[i], "[^.]+");
                if (matches.Count < 3)
                    return i;
                string classtype = matches[0].Value;
                string id = matches[1].Value;
                string var = matches[2].Value;
                Console.WriteLine(classes[classtype][id][var]);
                return i;
            }

            int arc_using(int i)
            {
                i++;
                string classfile = code[i];
                i++;
                while (!expect(code, i, "as")) { i++; }
                i++;
                string classtype = code[i];

                if (classfile.EndsWith("*\""))
                {
                    string[] path = Directory.GetFiles(directory + "\\" + classfile.Substring(1, classfile.Length - 3));
                    for (int j = 0; j < path.Length; j++)
                        LoadClasses(File.ReadAllText(path[j]), classtype);
                }
                else
                {
                    LoadClasses(File.ReadAllText(directory + "\\" + classfile.Substring(1, classfile.Length - 2)), classtype);
                }

                return i;
            }

            return result;
        }
        private void LoadClasses(string file, string classtype)
        {
            string[] classcode = ParseString(Regex.Replace(file, "#.*", ""));
            int indent = 0;
            string keyholder = "";
            string id = "";

            if (!classes.ContainsKey(classtype))
                classes.Add(classtype, new Dictionary<string, Dictionary<string, string>>());

            Dictionary<string, string> elements = new Dictionary<string, string>();

            for (int i = 0; i < classcode.Length; i++)
            {
                string g = classcode[i];
                switch (g)
                {
                    case "}":
                        indent--;
                        if (indent == 0)
                        {
                            elements.Add("id", id);
                            classes[classtype].Add(id, new Dictionary<string, string>(elements));
                        }
                        else if (indent >= 2)
                            elements[keyholder] += "} ";
                        break;
                    case "{":
                        indent++;
                        if (indent >= 2)
                            elements[keyholder] += "{ ";
                        break;
                    case string s when indent == 0:
                        elements.Clear();
                        id = s;
                        i++; while(!_expect(i, "=")) { i++; }
                        i++; while(!_expect(i, "{")) { i++; }
                        indent++;
                        break;
                    case string s when indent == 1:
                        keyholder = s;
                        i++; while (!_expect(i, "=")) { i++; }
                        i++; if (classcode[i] == "{")
                        {
                            keyholder = s;
                            indent++;
                            elements.Add(keyholder, "");
                        }
                        else
                            elements.Add(s, classcode[i]);
                        break;
                    case string s when indent >= 2:
                        elements[keyholder] += s + " ";
                        break;
                }
            }
            bool _expect(int index, string regex, string error = "")
            {
                return actual_except(classcode[index], index, regex, error);
            }

            return;
        }
        private bool expect(string[] code, int index, string regex, string error = "") { return actual_except(code[index],index,regex,error); }
        private bool actual_except(string str, int index, string regex, string error)
        {
            if (Regex.IsMatch(str, regex))
                return true;
            if (str == "\\t" || str == "\\n")
                return false;

            if (error == "")
                Console.WriteLine(new Exception("Expecting " + regex + " at index " + index));
            else
                Console.WriteLine(error);

            throw new Exception("Arc Exception");
        }
        private static string[] ParseString(string str)
        {
            var retval = new List<string>();
            if (String.IsNullOrWhiteSpace(str)) return retval.ToArray();
            int ndx = 0;
            string s = "";
            bool insideDoubleQuote = false;
            int indent = 0;

            while (ndx < str.Length)
            {
                if ((str[ndx] == ' ' || str[ndx] == '\n' || str[ndx] == '\t') && !insideDoubleQuote && indent == 0)
                {
                    if (!String.IsNullOrWhiteSpace(s.Trim())) retval.Add(s.Trim());
                    s = "";
                }
                if (str[ndx] == '"') insideDoubleQuote = !insideDoubleQuote;
                if (str[ndx] == '(') indent++;
                if (str[ndx] == ')') indent--;
                s += str[ndx];
                ndx++;
            }
            if (!String.IsNullOrWhiteSpace(s.Trim())) retval.Add(s.Trim());
            return retval.ToArray();
        }
    }
}
