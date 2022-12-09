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
            bool syntax = false;
            Arc arc = new Arc();
            try
            {
                if (args.Length > 0)
                {
                    switch (args[0])
                    {
                        case "c":
                            arc.main(syntax, args[1]);
                            break;
                        case "a":
                            arc.main(syntax);
                            break;
                        case "i":
                            arc.interpreter();
                            break;
                        case "t":
                            arc.test();
                            break;
                    }
                }
                else
                {
                    Console.WriteLine("write a for transpiling all files, c for transpiling a specific file, or i for interpreting code");
                    string input = "";
                    while (input != "c" && input != "a" && input != "i" && input != "t")
                    {
                        input = Console.ReadLine();
                    }
                    switch (input)
                    {
                        case "c":
                            Console.WriteLine("Write the path");
                            arc.main(syntax, Console.ReadLine());
                            break;
                        case "a":
                            arc.main(syntax);
                            break;
                        case "i":
                            arc.interpreter();
                            break;
                        case "t":
                            arc.test();
                            break;
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            Console.WriteLine("Press any key to exit");
            Console.ReadKey();
        }
    }
    class Arc
    {
        public Dictionary<string, string> provinces = new Dictionary<string, string>();
        public Dictionary<string, string> countries = new Dictionary<string, string>();
        public Dictionary<string, string> loc = new Dictionary<string, string>();
        public Dictionary<string, string> mod = new Dictionary<string, string>();
        string directory;
        public void write(Dictionary<string, string> ide, string key, string modifiers)
        {

            if (ide.ContainsKey(key))
                ide[key] = modifiers;
            else
                ide.Add(key, modifiers);
        }
        private void readLoc()
        {
            if (!File.Exists(directory + "\\localisation\\english\\arc_l_english.yml"))
                File.Create(directory + "\\localisation\\english\\arc_l_english.yml").Dispose();
            string[] loca = File.ReadAllLines(directory + "\\localisation\\english\\arc_l_english.yml");
            for (int i = 0; i < loca.Length; i++)
            {
                Match match = Regex.Match(loca[i], "([A-Za-z0-9_.-]+): +\"([^\"]*)\"");
                if (match.Success)
                    loc.Add(match.Groups[1].Value, '\"' + match.Groups[2].Value + '\"');
            }
        }
        private void readMod()
        {
            if (!File.Exists(directory + "\\common\\event_modifiers\\arc.txt"))
                File.Create(directory + "\\common\\event_modifiers\\arc.txt").Dispose();
            string loca = File.ReadAllText(directory + "\\common\\event_modifiers\\arc.txt");
            MatchCollection match = Regex.Matches(loca, "([^ ]+) += +{ +([^}]+) +} +");
            for(int v = 0; v < match.Count; v++)
                mod.Add(match[v].Groups[1].Value, match[v].Groups[2].Value);
        }
        private void readProv()
        {
            System.Diagnostics.Stopwatch watch = new System.Diagnostics.Stopwatch();
            watch.Start();
            string prova = File.ReadAllText(directory + "\\localisation\\replace\\es_provinces_l_english.yml");
            MatchCollection m = Regex.Matches(prova, "^ PROV(\\d+): \"([^\"]+)\"", RegexOptions.Multiline);
            try { provinces = m.Cast<Match>().ToDictionary(n => n.Groups[2].Value, n => n.Groups[1].Value); }
            catch (Exception)
            {
                Console.WriteLine("Duplicate non empty province names");
                for (int i = 0; i < m.Count; i++)
                {
                    try { provinces.Add(m[i].Groups[2].Value.ToUpper(), m[i].Groups[1].Value); }
                    catch (Exception) { Console.WriteLine(m[i].Groups[2].Value.ToUpper() + ", " + m[i].Groups[1].Value); }
                }
            }
            Console.WriteLine(watch.ElapsedMilliseconds);
        }
        private void readCountr()
        {
            string[] prova = File.ReadAllLines(directory + "\\localisation\\replace\\countries_l_english.yml");
            for (int i = 0; i < prova.Length; i++)
            {
                Match m = Regex.Match(prova[i], "([a-zA-Z0-9]{3}):([0-9]+)? *\"([^\"]*)\"");
                if (m.Success)
                    try { countries.Add(m.Groups[3].Value.ToUpper(), m.Groups[1].Value); } catch (Exception) { }
            }
        }
        private void saveMod()
        {
            if (!File.Exists(directory + "\\common\\event_modifiers\\arc.txt"))
                File.Create(directory + "\\common\\event_modifiers\\arc.txt").Dispose();
            List<string> loca = new List<string>();
            for (int i = 0; i < mod.Count; i++)
            {
                loca.Add(mod.Keys.ElementAt(i) + " = { " + mod.Values.ElementAt(i) + "} ");
            }
            string loca2 = "";
            for (int i = 0; i < loca.Count; i++)
            {
                loca2 += loca[i];
            }
            File.WriteAllText(directory + "\\common\\event_modifiers\\arc.txt", loca2);
        }
        private void saveLoc()
        {
            if (!File.Exists(directory + "\\localisation\\english\\arc_l_english.yml"))
                File.Create(directory + "\\localisation\\english\\arc_l_english.yml").Dispose();
            List<string> loca = new List<string>();
            loca.Add("l_english:");
            for (int i = 0; i < loc.Count; i++)
            {
                loca.Add(" " + loc.Keys.ElementAt(i) + ": " + loc.Values.ElementAt(i));
            }
            string loca2 = "";
            for (int i = 0; i < loca.Count; i++)
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
        public void test()
        {
            System.Globalization.CultureInfo.CurrentCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en");
            directory = AppDomain.CurrentDomain.BaseDirectory;
            System.Diagnostics.Stopwatch watch = new System.Diagnostics.Stopwatch();
            watch.Start();
            readLoc();
            long time = watch.ElapsedMilliseconds;
            Console.WriteLine(time);
            readMod();
            time = watch.ElapsedMilliseconds - time;
            Console.WriteLine(time);
            readCountr();
            time = watch.ElapsedMilliseconds - time;
            Console.WriteLine(time);
            readProv();
            time = watch.ElapsedMilliseconds - time;
            Console.WriteLine(time);

            LoadFolder(directory+"tests");

            void LoadFolder(string start)
            {
                string[] folder = Directory.GetDirectories(start);
                for (int i = 0; i < folder.Length; i++)
                    LoadFolder(folder[i]);

                string[] files = Directory.GetFiles(start);
                for (int i = 0; i < files.Length; i++)
                    if (files[i].EndsWith(".arc-test"))
                    {
                        try
                        {
                            string com = new Compiler(directory, this).compile(Regex.Replace(File.ReadAllText(files[i]), "#.*", ""));
                            string com2 = File.ReadAllText(files[i] + "-result");
                            if (com == com2)
                            {
                                Console.WriteLine("Success on " + Regex.Match(files[i].Replace("\\","|"),"[^|]+",RegexOptions.RightToLeft));
                            }
                            else
                            {
                                Console.WriteLine("Failure on " + files[i]);
                                Console.WriteLine("Difference = " + string.Compare(com, com2));
                                Console.WriteLine("Expected: " + com2);
                                Console.WriteLine("Got:      " + com);
                            }
                        }
                        catch (Exception e) { Console.WriteLine(e.Message + " at " + files[i]); };
                    }
            }
        }
        public void interpreter()
        {
            System.Globalization.CultureInfo.CurrentCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en");
            directory = AppDomain.CurrentDomain.BaseDirectory;
            System.Diagnostics.Stopwatch watch = new System.Diagnostics.Stopwatch();
            watch.Start();
            readLoc();
            long time = watch.ElapsedMilliseconds;
            Console.WriteLine(time);
            readMod();
            time = watch.ElapsedMilliseconds - time;
            Console.WriteLine(time);
            readCountr();
            time = watch.ElapsedMilliseconds - time;
            Console.WriteLine(time);
            readProv();
            time = watch.ElapsedMilliseconds - time;
            Console.WriteLine(time);

            Compiler com = new Compiler(directory,this);
            Console.WriteLine("Interpeter Engaged. Type exit to Exit");
            string input = Console.ReadLine();
            while (input != "exit")
            {
                Console.SetCursorPosition(0, Console.CursorTop - 1);
                ClearCurrentConsoleLine();
                try { Console.WriteLine(com.compile(input),true); }
                catch(Exception e) { Console.WriteLine(e); }
                input = Console.ReadLine();
            }
        }
        public static void ClearCurrentConsoleLine()
        {
            int currentLineCursor = Console.CursorTop;
            Console.SetCursorPosition(0, Console.CursorTop);
            for (int i = 0; i < Console.WindowWidth; i++)
                Console.Write(" ");
            Console.SetCursorPosition(0, currentLineCursor);
        }
        public void main(bool syntax, string file = "")
        {
            System.Globalization.CultureInfo.CurrentCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en");
            directory = AppDomain.CurrentDomain.BaseDirectory;
            readLoc();
            readMod();
            readCountr();
            readProv();
            if (file == "")
                LoadFolder(directory);
            else
            {
                if (syntax)
                    File.WriteAllText(file.Substring(0, file.Length - 4) + ".txt",
                        new Compiler(directory, this).compile(
                            Regex.Replace(File.ReadAllText(file), "#.*", "")
                                .Replace("\n", " \\n ")
                                .Replace("\t", " \\t ")
                        )
                    );
                else
                    File.WriteAllText(file.Substring(0, file.Length - 4) + ".txt",
                        new Compiler(directory, this).compile(
                            Regex.Replace(File.ReadAllText(file), "#.*", "")
                        )
                    );
                Console.WriteLine("Transpiled " + file);
            }

            void LoadFolder(string start)
            {
                string[] folder = Directory.GetDirectories(start);
                for (int i = 0; i < folder.Length; i++)
                    LoadFolder(folder[i]);

                string[] files = Directory.GetFiles(start);
                for (int i = 0; i < files.Length; i++)
                    if (files[i].EndsWith(".arc"))
                    {
                        try
                        {
                            if (syntax)
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
            if (!classes.ContainsKey("defines"))
            {
                LoadClasses(Regex.Replace(File.ReadAllText(directory + "\\arc.defines"), "#.*", ""), "defines");
            }
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
                    //<number>% - <number>years - <number>months - <number>weeks
                    case string s when Regex.IsMatch(s, "-?[0-9]+(\\.[0-9]+)?%"):
                        result += (float.Parse(s.Substring(0, s.Length - 1)) / 100).ToString() + " ";
                        break;
                    case string s when Regex.IsMatch(s, "-?[0-9]+(\\.[0-9]+)?years", RegexOptions.IgnoreCase):
                        result += (float.Parse(s.Substring(0, s.Length - 5)) * 365).ToString() + " ";
                        break;
                    case string s when Regex.IsMatch(s, "-?[0-9]+(\\.[0-9]+)?months", RegexOptions.IgnoreCase):
                        result += (float.Parse(s.Substring(0, s.Length - 6)) * 30).ToString() + " ";
                        break;
                    case string s when Regex.IsMatch(s, "-?[0-9]+(\\.[0-9]+)?weeks", RegexOptions.IgnoreCase):
                        result += (float.Parse(s.Substring(0, s.Length - 5)) * 7).ToString() + " ";
                        break;

                    //Checks for multiscope ex: CB8,
                    case string s when Regex.IsMatch(s, "[^,],"):
                        multiscope.Add(s.Substring(0, s.Length - 1));
                        if (currentscope.Count == 0 || currentscope[0] != "multiscope")
                            currentscope.Insert(0, "multiscope");
                        break;
                    //Math expressions (6*2)
                    case string s when Regex.IsMatch(s, "\\([^()]+\\)"):
                        result += arc_math(Regex.Match(Regex.Match(s, "\\([^()]+\\)").Value, "[^()]+").Value) + " ";
                        break;
                    case string _ when g.ToLower() == "defineloc":
                        i = arc_defineloc(i);
                        break;
                    case "for":
                        result += arc_for(i, out i);
                        break;
                    case "using": i = arc_using(i); break;
                    case "foreach": result += arc_foreach(i, out i); break;
                    //Class.Id.Key
                    case string s when Regex.IsMatch(s, "([^.]+)\\.([^.]+)\\.([^.]+)") && classes.ContainsKey(Regex.Match(s, "[^.]+").Value):
                        result += arc_class(i, out i) + " ";
                        break;
                    case string s when variables.ContainsKey(s):
                        result += variables[s] + " ";
                        break;
                    case string s when currentscope.Count > 0:
                        switch (currentscope[0])
                        {
                            case "multiscope":
                                result += arc_multiscope(g, i, out i);
                                break;
                        }
                        break;
                    case string s when s.StartsWith("p@"):
                        result += owner.provinces[s.Substring(2).Replace("_", " ").ToUpper()] + " ";
                        break;
                    case string s when s.StartsWith("c@"):
                        result += owner.countries[s.Substring(2).Replace("_", " ").ToUpper()] + " ";
                        break;
                    default:
                        result += g + " ";
                        break;
                }
            }
            string arc_modifier(int a, out int i)
            {
                i = a;
                i++; while (!expect(code, i, "=")) { i++; }
                i++; while (!expect(code, i, "{")) { i++; }
                i++; while (!expect(code, i, "id")) { i++; }
                i++; while (!expect(code, i, "=")) { i++; }
                i++; string id = code[i];
                i++; while (!expect(code, i, "type")) { i++; }
                i++; while (!expect(code, i, "=")) { i++; }
                i++; string type = Regex.Match(code[i], "[^(]+").Value;
                string duration = arc_math(Regex.Match(code[i], "\\([^()]*\\)").Value);
                if (duration == "") duration = "-1";
                i++; while (!expect(code, i, "name")) { i++; }
                i++; while (!expect(code, i, "=")) { i++; }
                i++; string name = code[i];
                i++; while (!expect(code, i, "desc")) { i++; }
                i++; while (!expect(code, i, "=")) { i++; }
                i++; string desc = code[i];
                i++; while (!expect(code, i, "modifiers")) { i++; }
                i++; while (!expect(code, i, "=")) { i++; }
                i++; while (!expect(code, i, "{")) { i++; }
                i++; string modifiers = code[i];
                i++; while (!expect(code, i, "}")) { i++; }
                i++; while (!expect(code, i, "}")) { i++; }
                owner.write(owner.loc, id, name);
                owner.write(owner.loc, id + "_desc", desc);
                owner.write(owner.mod, id, modifiers);
                return "add_" + type + "_modifier = { name = " + id + " duration = " + duration + " desc = " + id + "_desc hidden = no } ";
            }
            int arc_variable(int i)
            {
                i++; string varname = code[i];
                i++; while (!expect(code, i, "=")) { i++; }
                i++; string varvalue = code[i];
                if (varvalue.Contains("("))
                    varvalue = arc_math(Regex.Match(varvalue, "\\(.*\\)").Value);
                setVar(varname, varvalue);
                return i++;
            }
            string arc_for(int a, out int i)
            {
                i = a;
                i++; string varname = code[i];
                i++; while (!expect(code, i, "=")) { i++; }
                i++; int start = int.Parse(low_compile(ParseString(code[i])));
                i++; while (!expect(code, i, "to")) { i++; }
                i++;
                int end = int.Parse(low_compile(ParseString(code[i])));
                i++; while (!expect(code, i, "=")) { i++; }
                i++; while (!expect(code, i, "{")) { i++; }
                i++;
                int indent = 1;
                List<string> loop = new List<string>();

                while (indent > 0)
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
                            if (indent > 0)
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

                i--;
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
                owner.write(owner.loc, key, value);
                return i;
            }
            string arc_multiscope(string g, int a, out int i)
            {
                i = a;
                currentscope.RemoveAt(0);
                multiscope.Add(g);
                List<string> effect = new List<string>();
                i++; while (!expect(code, i, "=")) { i++; }
                effect.Add("=");
                i++; while (!expect(code, i, "{")) { i++; }
                effect.Add("{");
                int index = 1;
                while (index > 0)
                {
                    i++; g = code[i];
                    effect.Add(g);
                    if (g == "{") index++;
                    if (g == "}") index--;
                }
                string[] newcode = new string[(effect.Count + 1) * multiscope.Count];
                for (int j = 0; j < multiscope.Count; j++)
                {
                    newcode[j * (effect.Count + 1)] = multiscope[j];
                    for (int k = 0; k < effect.Count; k++)
                    {
                        newcode[k + (j * (effect.Count + 1)) + 1] = effect[k];
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
                return Regex.Match(new DataTable().Compute(expression, "").ToString(), "[^.]+").Value;
            }
            string arc_foreach(int a, out int i)
            {
                string condition = "";
                int wherecount = 0;
                i = a;
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
                    if (Regex.IsMatch(code[i + g], "where"))
                    {
                        g++; wherecount++; while (!expect(code, i + g, "=")) { g++; wherecount++; }
                        g++; wherecount++; while (!expect(code, i + g, "{")) { g++; wherecount++; }
                        g++; wherecount++;
                        while (code[i + g] != "}")
                        {
                            wherecount++;
                            condition += code[i + g];
                            g++;
                        }
                        g++; wherecount++;
                    }
                    indent += Regex.Matches(code[i + g], "{").Count;
                    indent -= Regex.Matches(code[i + g], "}").Count;
                    if (indent > 0) loop.Add(code[i + g]);
                    g++;
                }
                condition = Regex.Replace(condition, "\\\\[tn]", "");

                List<string> ForEach = new List<string>();

                for (int z = 0; z < classes[currentClass].Count; z++)
                {
                    string id = classes[currentClass].ElementAt(z).Key;
                    if (classes[currentClass][id]["id"] != "default")
                    {
                        if (condition == "" || expressiontobool(condition))
                        {
                            for (int b = 0; b < loop.Count; b++)
                            {
                                if (Regex.Matches(loop[b], currentClass + "\\.").Count == 1)
                                {
                                    string var = Regex.Match(loop[b], "[^.*/+-]+").NextMatch().Value;
                                    try { ForEach.Add(Regex.Replace(loop[b], currentClass + "\\." + var, classes[currentClass].ElementAt(z).Value[var])); }
                                    catch (KeyNotFoundException)
                                    {
                                        try { ForEach.Add(Regex.Replace(loop[b], currentClass + "\\." + var, classes[currentClass]["default"][var])); }
                                        catch (KeyNotFoundException) { ForEach.Add(Regex.Replace(loop[b], currentClass + "\\." + var, "")); }
                                    }
                                }
                                else
                                    ForEach.Add(loop[b]);
                            }
                        }
                    }
                }

                i += wherecount;
                if (wherecount > 0)
                    i += 4;
                i += loop.Count;

                return low_compile(ForEach.ToArray());

                bool expressiontobool(string expression)
                {
                    for (int h = 0; h < expression.Length; h++)
                    {

                    }

                    return false;
                }
            }
            string arc_class(int a, out int i)
            {
                i = a;
                MatchCollection matches = Regex.Matches(code[i], "[^.]+");
                if (matches.Count < 3)
                    return "";
                string classtype = matches[0].Value;
                string id = matches[1].Value;
                string var = matches[2].Value;
                try { return low_compile(ParseString(classes[classtype][id][var])); }
                catch (KeyNotFoundException)
                {
                    try { return low_compile(ParseString(classes[classtype]["default"][var])); }
                    catch (KeyNotFoundException) { return ""; }
                }
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
                        i++; while (!_expect(i, "=")) { i++; }
                        i++; while (!_expect(i, "{")) { i++; }
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
        private bool expect(string[] code, int index, string regex, string error = "") { return actual_except(code[index], index, regex, error); }
        private bool actual_except(string str, int index, string regex, string error)
        {
            if (Regex.IsMatch(str, regex))
                return true;
            if (str == "\\t" || str == "\\n")
                return false;

            if (error == "")
                Console.WriteLine(new Exception("Expecting " + regex + " at index " + index + " was " + str));
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
