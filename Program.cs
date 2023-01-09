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
                        case "tf":
                            arc.test(true);
                            break;
                        case "d":
                            arc.drop();
                            break;
                    }
                }
                else
                {
                    Console.WriteLine("write a for transpiling all files, c for transpiling a specific file, or i for interpreting code");
                    string input = "";
                    while (input != "c" && input != "a" && input != "i" && input != "t" && input != "tf" && input != "d")
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
                        case "tf":
                            arc.test(true);
                            break;
                        case "d":
                            arc.drop();
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
        public Dictionary<string, string> areas = new Dictionary<string, string>();
        public Dictionary<string, string> countries = new Dictionary<string, string>();
        public Dictionary<string, string> loc = new Dictionary<string, string>();
        public Dictionary<string, string> mod = new Dictionary<string, string>();
        public List<string> events = new List<string>();
        string directory;
        public void write(Dictionary<string, string> ide, string key, string value)
        {

            if (ide.ContainsKey(key))
                ide[key] = value;
            else
                ide.Add(key, value);
        }
        private void readLoc()
        {
            if (!File.Exists(directory + "\\localisation\\english\\arc_l_english.yml"))
                return;
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
                return;
            string loca = File.ReadAllText(directory + "\\common\\event_modifiers\\arc.txt");
            MatchCollection match = Regex.Matches(loca, "([^ ]+) += +{ +([^}]+) +} +");
            for(int v = 0; v < match.Count; v++)
                mod.Add(match[v].Groups[1].Value, match[v].Groups[2].Value);
        }
        private void readProv()
        {
            if (!File.Exists(directory + "\\localisation\\replace\\es_provinces_l_english.yml"))
                return;
            using (StreamReader reader = new StreamReader(directory + "\\localisation\\replace\\es_provinces_l_english.yml"))
            {
                string line;
                while ((line = reader.ReadLine()) != null)
                {
                    Match match = Regex.Match(line, "^ PROV(\\d+): +\"([^\"]+)\"");
                    if (match.Success)
                    {
                        string value = match.Groups[1].Value;
                        string key = match.Groups[2].Value.ToUpper();

                        if (!provinces.ContainsKey(key))
                        {
                            provinces.Add(key, value);
                        }
                        //else //Debug
                        //{
                        //    Console.WriteLine("Duplicate non empty province name: " + key + ", " + value);
                        //}
                    }
                }
            }
        }
        private void readCountr()
        {
            if (!File.Exists(directory + "\\localisation\\replace\\countries_l_english.yml"))
                return;
            string[] prova = File.ReadAllLines(directory + "\\localisation\\replace\\countries_l_english.yml");
            for (int i = 0; i < prova.Length; i++)
            {
                Match m = Regex.Match(prova[i], "([a-zA-Z0-9]{3}):([0-9]+)? *\"([^\"]*)\"");
                if (m.Success)
                    try { countries.Add(m.Groups[3].Value.ToUpper(), m.Groups[1].Value); } catch (Exception) { }
            }
        }
        private void readEvents()
        {
            if (!File.Exists(directory + "\\events\\arc.txt"))
                return;
            string[] eventa = File.ReadAllLines(directory + "\\events\\arc.txt");
            foreach (string av in eventa)
            {
                Match m = Regex.Match(av, "(country|province)_event = {(.*)}");
                if (m.Success)
                    events.Add(m.Value);
            }
        }
        private void readArea()
        {
            if (!File.Exists(directory + "\\map\\area.txt"))
                return;

            string areaFile = File.ReadAllText(directory + "\\map\\area.txt");
            MatchCollection areas = Regex.Matches(areaFile, "([a-z_0-9]+) *= *{\\s*(( [0-9]*)+)\\s*}", RegexOptions.Multiline);
            foreach (Match area in areas)
            {
                this.areas.Add(area.Groups[1].Value, area.Groups[2].Value);
            }
        }
        private void readAll()
        {
            //readLoc();
            //readMod();
            readCountr();
            readProv();
            readArea();
            //readRegion();
            //readSuperregion();
            //readContinent();
            //readEvents();
        }
        private void saveAll()
        {
            saveMod();
            saveLoc();
            saveEvents();
        }
        private void saveEvents()
        {
            if (!File.Exists(directory + "\\events\\arc.txt"))
                File.Create(directory + "\\events\\arc.txt").Dispose();
            string ret = "namespace = arc\n";
            foreach (string s in events)
            {
                ret += s + "\n";
            }
            File.WriteAllText(directory + "\\events\\arc.txt", ret);
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
        public void drop()
        {
            System.Globalization.CultureInfo.CurrentCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en");
            directory = AppDomain.CurrentDomain.BaseDirectory;
            readAll();
            Console.WriteLine("\n\n\tProvinces\n");
            foreach (KeyValuePair<string,string> a in provinces){
                Console.Write(a.Key + " | ");
            }
            Console.WriteLine("\n\n\tCountries\n");
            foreach (KeyValuePair<string,string> a in countries){
                Console.Write(a.Key + " | ");
            }
            Console.WriteLine("\n\n\tModifiers\n");
            foreach (KeyValuePair<string,string> a in mod){
                Console.Write(a.Key + " | ");
            }
            Console.WriteLine("\n\n\tLocalization\n");
            foreach (KeyValuePair<string,string> a in loc){
                Console.Write(a.Key + " | ");
            }
            Console.WriteLine("\n\n\tEvents");
            foreach (string s in events)
            {
                Console.WriteLine(s);
            }
            Console.WriteLine("\n\n\tAreas");
            foreach (KeyValuePair<string,string> s in areas)
            {
                Console.WriteLine(s.Key + ":" + s.Value);
            }
        }
        public void test(bool a = false)
        {
            System.Globalization.CultureInfo.CurrentCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en");
            directory = AppDomain.CurrentDomain.BaseDirectory;
            readAll();

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
                        //try
                        //{
                            string com = new Compiler(directory, this).compile(Regex.Replace(File.ReadAllText(files[i]), "#.*", ""));
                            if (a) 
                            {
                                File.WriteAllText(files[i] + "-result", com);
                            }
                            else
                            {
                                string com2 = File.ReadAllText(files[i] + "-result");
                                com = com.Trim();
                                com2 = com2.Trim();
                                if (com == com2)
                                {
                                    Console.WriteLine("Success on " + Regex.Match(files[i].Replace("\\", "|"), "[^|]+", RegexOptions.RightToLeft));
                                }
                                else
                                {
                                    Console.WriteLine("Failure on " + files[i]);
                                    Console.WriteLine("Difference = " + FindDifferences(com,com2));
                                    Console.WriteLine("Expected: " + com2);
                                    Console.WriteLine("Got:      " + com);
                                }
                            }
                        //}
                        //catch (Exception e) { Console.WriteLine(e.Message + " at " + files[i]); };
                    }
                return;
            }
        }
        public string FindDifferences(string str1, string str2)
        {
            List<string> differences = new List<string>();

            // Split the strings into arrays of characters
            char[] charArray1 = str1.ToCharArray();
            char[] charArray2 = str2.ToCharArray();

            // Find the length of the shorter array
            int minLength = Math.Min(charArray1.Length, charArray2.Length);

            // Compare the characters in the arrays and add any differences to the list
            for (int i = 0; i < minLength; i++)
            {
                if (charArray1[i] != charArray2[i])
                {
                    int j = i + 1;
                    while (j < minLength && charArray1[j] != charArray2[j])
                    {
                        j++;
                    }
                    differences.Add($"Difference at indices {i}-{j - 1}: '{str1.Substring(i, j - i)}' vs '{str2.Substring(i, j - i)}'");
                    i = j - 1;
                }
            }

            // If one array is longer than the other, add the remaining characters to the list of differences
            if (charArray1.Length > minLength)
            {
                differences.Add($"Extra characters at indices {minLength}-{charArray1.Length - 1}: '{str1.Substring(minLength)}'");
            }
            else if (charArray2.Length > minLength)
            {
                differences.Add($"Extra characters at indices {minLength}-{charArray2.Length - 1}: '{str2.Substring(minLength)}'");
            }

            return string.Join("\n", differences);
        }
        public void interpreter()
        {
            System.Globalization.CultureInfo.CurrentCulture = System.Globalization.CultureInfo.CreateSpecificCulture("en");
            directory = AppDomain.CurrentDomain.BaseDirectory;
            readAll();

            Compiler com = new Compiler(directory,this);
            Console.WriteLine("Interpeter Engaged. Type exit to Exit");
            string input = Console.ReadLine();
            while (input != "exit")
            {
                Console.SetCursorPosition(0, Console.CursorTop - 1);
                ClearCurrentConsoleLine();
                try { Console.WriteLine(com.compile(input)); }
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
            readAll();
            if (true || file == "") //Disabled due to arc becoming too complicated
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
            saveAll();

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
        }
    }
    enum LogicalScope
    {
        AND,
        OR,
        NOT
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
        public string low_compile(List<string> code)
        {
            string result = "";
            Dictionary<string,Func<int, int>> keywords = new Dictionary<string, Func<int, int>>()
            {
                { "\\t", 
                    (int i)=>{
                        result += "\t";
                        return i; 
                    } 
                },
                { "\\n", 
                    (int i)=>{
                        result += "\n";
                        return i; 
                    } 
                },
                { "arc_modifier", 
                    (int i) =>{
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
                        result += "add_" + type + "_modifier = { name = " + id + " duration = " + duration + " desc = " + id + "_desc hidden = no } ";
                        return i;
                    } 
                },
                { "><",
                    (int i) =>
                    {
                        result = result.Trim();
                        return i;
                    }
                },
                { "var",
                    (int i) =>
                    {
                        i++; string varname = code[i];
                        i++; while (!expect(code, i, "=")) { i++; }
                        i++; string varvalue = code[i];
                        setVar(varname, compile(varvalue).Trim());
                        return i++;
                    }
                },
                { "eval",
                    (int i) =>
                    {
                        i++;
                        if (variables[code[i]].StartsWith("\"")) result += compile(variables[code[i]].Substring(1,variables[code[i]].Length-2));
                        else result += compile(variables[code[i]]);
                        return i;
                    }
                },
                { "defineMod",
                    (int i) =>
                    {
                        i++; string id = code[i];
                        i++; while(!expect(code, i, "=")) { i++; }
                        i++; while(!expect(code, i, "{")) { i++; }
                        string modifiers = "";
                        i++; while(code[i] != "}")
                        {
                            modifiers += code[i] + " ";
                            i++;
                        }
                        owner.write(owner.mod, id, modifiers);
                        return i;
                    }
                },
                { "definemod",
                    (int i) =>
                    {
                        i++; string id = code[i];
                        i++; while(!expect(code, i, "=")) { i++; }
                        i++; while(!expect(code, i, "{")) { i++; }
                        string modifiers = "";
                        i++; while(code[i] != "}")
                        {
                            modifiers += code[i] + " ";
                            i++;
                        }
                        owner.write(owner.mod, id, modifiers);
                        return i;
                    }
                },
                { "NAND",
                    (int i) =>
                    {
                        i++; while (!expect(code, i, "=")) { i++; }
                        i++; while (!expect(code, i, "{")) { i++; }
                        i++;
                        result += "NOT = { AND = {";
                        int indent = 1;
                        List<string> codr = new List<string>();
                        while(indent > 0)
                        {
                            indent += Regex.Matches(code[i], "{").Count;
                            indent -= Regex.Matches(code[i], "}").Count;
                            if(indent > 0)
                                codr.Add(code[i]);
                            i++;
                        }
                        result += low_compile(codr);
                        result += "} } ";
                        return i;
                    }
                },
                { "defineLoc",
                    (int i) =>
                    {
                        i++; string key = code[i];
                        i++; i++; string value = code[i];
                        owner.write(owner.loc, key, value);
                        return i;
                    }
                },
                { "defineloc",
                    (int i) =>
                    {
                        i++; string key = code[i];
                        i++; i++; string value = code[i];
                        owner.write(owner.loc, key, value);
                        return i;
                    }
                },
                { "for",
                    (int i) =>
                    {
                        i++; string varname = code[i];
                        i++; while (!expect(code, i, "=")) { i++; }
                        i++; int start = int.Parse(compile(code[i]));
                        i++; while (!expect(code, i, "to")) { i++; }
                        i++;
                        int end = int.Parse(compile(code[i]));
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

                        bool isatend = true;
                        for (int j = start; isatend; j = towards(j, away(end, start)))
                        {
                            final.Add("var");
                            final.Add(varname);
                            final.Add("=");
                            final.Add(j.ToString());
                            for (int h = 0; h < loop.Count; h++)
                                final.Add(loop[h]);
                            isatend = j != end;
                        }

                        i--;
                        result += low_compile(final);

                        return i;

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
                },
                { "quick_event",
                    (int i) =>
                    {
                        i++; while (!expect(code, i, "=")) { i++; }
                        i++; while (!expect(code, i, "{")) { i++; }
                        i++; while (!expect(code, i, "alias")) { i++; }
                        i++; while (!expect(code, i, "=")) { i++; }
                        i++; string alias = code[i];
                        i++; while (!expect(code, i, "type")) { i++; }
                        i++; while (!expect(code, i, "=")) { i++; }
                        i++; while (!expect(code, i, "province|country")) { i++; }
                        string type = code[i];

                        string qevent = type + "_event = { id = arc." + owner.events.Count + " ";

                        int indent = 1;
                        while (indent > 0)
                        {
                            i++;
                            if (code[i] == "{") indent++;
                            if (code[i] == "}") indent--;

                            if(indent > 0)
                                qevent += code[i] + " ";
                        }
                        qevent += " }";
                        setVar(alias, "arc." + owner.events.Count);
                        owner.events.Add(compile(qevent.Replace(alias, "arc." + owner.events.Count)));

                        return i;
                    }
                },
                { "using",
                    (int i) =>
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
                },
                { "foreach",
                    (int i) =>
                    {
                        string condition = "";
                        int wherecount = 0;
                        i++;
                        string currentClass = code[i];
                        if (currentClass.StartsWith("["))
                        {
                            currentClass += " ";
                            while (!currentClass.Trim().EndsWith("]"))
                            {
                                i++;
                                currentClass += code[i] + " ";
                            }
                            currentClass.Replace(";", " = { }");
                        }
                        i++;
                        string alias = currentClass;
                        if (code[i] == "as")
                        {
                            i++;
                            alias = code[i];
                            i++;
                        }
                        if (currentClass.StartsWith("["))
                        {
                            LoadClasses(currentClass.Substring(1, currentClass.Length - 3), alias);
                            currentClass = alias;
                        }
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
                                int indent2 = 1;
                                g++; wherecount++; while (!expect(code, i + g, "=")) { g++; wherecount++; }
                                g++; wherecount++; while (!expect(code, i + g, "{")) { g++; wherecount++; }
                                g++; wherecount++;
                                while (indent2 > 0)
                                {
                                    indent2 += Regex.Matches(code[i + g], "{").Count;
                                    indent2 -= Regex.Matches(code[i + g], "}").Count;
                                    if (indent2 > 0)
                                    {
                                        wherecount++;
                                        condition += code[i + g] + " ";
                                        g++;
                                    }
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
                                if (condition == "" || expressiontobool(ParseString(condition),id,LogicalScope.AND))
                                {
                                    for (int b = 0; b < loop.Count; b++)
                                    {
                                        if (Regex.Matches(loop[b], alias + "\\.").Count == 1)
                                        {
                                            string var = Regex.Match(loop[b], "[^.*/+-]+").NextMatch().Value;
                                            try { ForEach.Add(Regex.Replace(loop[b], alias + "\\." + var, classes[currentClass].ElementAt(z).Value[var])); }
                                            catch (KeyNotFoundException)
                                            {
                                                try { ForEach.Add(Regex.Replace(loop[b], alias + "\\." + var, classes[currentClass]["default"][var])); }
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
                        //if (wherecount > 0)
                        //    i += 4;
                        i += loop.Count;
                        if(currentClass.StartsWith("["))
                            classes.Remove(alias);
                        result += low_compile(ForEach);
                        return i;

                        bool expressiontobool(List<string> expression, string id, LogicalScope scope)
                        {
                            for(int c = 0; c < expression.Count; c++)
                            {
                                if (expression[c].StartsWith("\"") && expression[c].EndsWith("\""))
                                    expression[c] = expression[c].Substring(1, expression[c].Length - 2);
                            }
                            //for(int c = 0; c < expression.Length; c++)
                            //{
                            //    Console.Write(expression[c]);
                            //}
                            //Console.Write("\n");
                            bool istrue = false;
                            for (int h = 0; h < expression.Count; h++)
                            {
                                switch (expression[h])
                                {
                                    case "has_key":
                                        h++; except(h, "=");
                                        h++;
                                        LogicalScopeAssign(classes[currentClass][id].ContainsKey(expression[h]));
                                        break;
                                    case "key_contains":
                                        h++; except(h, "=");
                                        h++; except(h, "{");
                                        h++; except(h, "key");
                                        h++; except(h, "=");
                                        h++; string key = expression[h];
                                        h++; except(h, "value");
                                        h++; except(h, "=");
                                        h++; string value = expression[h];
                                        try { LogicalScopeAssign(classes[currentClass][id][key].Contains(value)); }
                                        catch(Exception) { LogicalScopeAssign(false); }
                                        h++; except(h, "}");
                                        break;
                                }
                            }

                            return istrue;

                            void LogicalScopeAssign(bool expr)
                            {
                                if(expr)
                                    switch (scope)
                                    {
                                        case LogicalScope.AND:
                                        case LogicalScope.OR:
                                            istrue = true;
                                            break;
                                        case LogicalScope.NOT:
                                            istrue = !true;
                                            break;
                                    }
                                else
                                    switch (scope)
                                    {
                                        case LogicalScope.AND:
                                            istrue = false;
                                            break;
                                        case LogicalScope.NOT:
                                            istrue = true;
                                            break;
                                    }
                            }
                            void except(int index, string regex, string error = "")
                            {
                                actual_except(expression[index],index,regex,error);
                            }
                        }
                    }
                }
            };

            for (int i = 0; i < code.Count; i++)
            {
                string g = code[i];
                if (keywords.ContainsKey(g))
                    i = keywords[g].Invoke(i);
                else if (Regex.IsMatch(g, "\\([^()]+\\)")) result += arc_math(Regex.Match(Regex.Match(g, "\\([^()]+\\)").Value, "[^()]+").Value) + " ";
                else if (variables.ContainsKey(g))
                    result += variables[g] + " ";
                else if (Regex.IsMatch(g, "([^.]+)\\.([^.]+)\\.([^.]+)") && classes.ContainsKey(Regex.Match(g, "[^.]+").Value))
                    result += arc_class(i, out i) + " ";
                else if (Regex.IsMatch(g, "[^,],"))
                {
                    result += arc_multiscope(i, out i);
                }
                else if (g.StartsWith("p@")) { 
                    try { result += owner.provinces[g.Substring(2).Replace("_", " ").ToUpper()] + " "; }
                    catch (Exception e) { Console.Write(g + ": "); throw e; }
                }
                else if (g.StartsWith("c@")) {
                    try { result += owner.countries[g.Substring(2).Replace("_", " ").ToUpper()] + " "; }
                    catch (Exception e) { Console.Write(g + ": "); throw e; } 
                }
                else if (g.StartsWith("a$"))
                {
                    try { result += owner.areas[g.Substring(2)] + " "; }
                    catch (Exception e) { Console.Write(g + ": "); throw e; }
                }
                else if (g.Length > 1 && g.EndsWith("%")) result += (float.Parse(g.Substring(0, g.Length - 1)) / 100).ToString() + " ";
                else if (g.Length > 5 && g.EndsWith("years")) result += (float.Parse(g.Substring(0, g.Length - 5)) * 365).ToString() + " ";
                else if (g.Length > 6 && g.EndsWith("months")) result += (float.Parse(g.Substring(0, g.Length - 6)) * 30).ToString() + " ";
                else if (g.Length > 7 && g.EndsWith("weeks")) result += (float.Parse(g.Substring(0, g.Length - 5)) * 7).ToString() + " ";
                else
                    result += g + " ";
            }

            return result;

            string arc_multiscope(int a, out int i)
            {
                i = a;
                while (code[i].EndsWith(","))
                {
                    multiscope.Add(code[i].Substring(0,code[i].Length-1));
                    i++;
                }
                multiscope.Add(code[i]);
                List<string> effect = new List<string>();
                i++; while (!expect(code, i, "=")) { i++; }
                effect.Add("=");
                i++; while (!expect(code, i, "{")) { i++; }
                effect.Add("{");
                int index = 1;
                while (index > 0)
                {
                    i++;
                    effect.Add(code[i]);
                    if (code[i] == "{") index++;
                    if (code[i] == "}") index--;
                }
                List<string> newcode = new List<string>();
                for (int j = 0; j < multiscope.Count; j++)
                {
                    newcode.Add(multiscope[j]);
                    for (int k = 0; k < effect.Count; k++)
                    {
                        newcode.Add(effect[k]);
                    }
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
                return Regex.Match(Evaluate(expression).ToString(), "[^.]+").Value;
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
                if (code.Count < i + 2 || code[i + 1] != "=")
                {
                    try { return low_compile(ParseString(classes[classtype][id][var])); }
                    catch (KeyNotFoundException)
                    {
                        try { return low_compile(ParseString(classes[classtype]["default"][var])); }
                        catch (KeyNotFoundException) { return ""; }
                    }
                }
                else
                {
                    i++; while (!expect(code, i, "=")) { i++; }
                    i++; while (!expect(code, i, "{")) { i++; }
                    i++;
                    List<string> gern = new List<string>();
                    Dictionary<string,string> repl = new Dictionary<string, string>();
                    while (code[i] != "}")
                    {
                        string variable = code[i];
                        i++; while (!expect(code, i, "=")) { i++; }
                        i++; string value = code[i];
                        if(variable.StartsWith("$") && variable.EndsWith("$"))
                        {
                            repl.Add(variable,value);
                            i++;
                            continue;
                        }    
                        variables.Add(variable, value);
                        gern.Add(variable);
                        i++;
                    }
                    string returnvalue = "";
                    try { returnvalue = compile(classes[classtype][id][var]); }
                    catch (KeyNotFoundException)
                    {
                        try { returnvalue = compile(classes[classtype]["default"][var]); }
                        catch (KeyNotFoundException) { returnvalue = ""; }
                    }
                    foreach(string vbar in gern)
                    {
                        variables.Remove(vbar);
                    }
                    foreach(KeyValuePair<string,string> vbar in repl)
                    {
                        returnvalue = returnvalue.Replace(vbar.Key, vbar.Value);
                    }
                    return returnvalue;
                }
            }
        }
        private void LoadClasses(string file, string classtype)
        {
            List<string> classcode = ParseString(Regex.Replace(file, "#.*", ""));
            int indent = 0;
            string keyholder = "";
            string id = "";

            if (!classes.ContainsKey(classtype))
                classes.Add(classtype, new Dictionary<string, Dictionary<string, string>>());

            Dictionary<string, string> elements = new Dictionary<string, string>();

            for (int i = 0; i < classcode.Count; i++)
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
        private bool expect(List<string> code, int index, string regex, string error = "") { return actual_except(code[index], index, regex, error); }
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
        private static List<string> ParseString(string str)
        {
            var retval = new List<string>();
            if (String.IsNullOrWhiteSpace(str)) return retval;
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
            return retval;
        }
        public float Evaluate(string equation)
        {
            while (equation.Contains("("))
            {
                int startIndex = equation.LastIndexOf("(") + 1;
                int endIndex = equation.IndexOf(")", startIndex);

                string expression = equation.Substring(startIndex, endIndex - startIndex);

                float result = EvaluateExpression(expression);

                equation = equation.Substring(0, startIndex - 1) + result.ToString() + equation.Substring(endIndex + 1);
            }

            return EvaluateExpression(equation);
        }
        public float EvaluateExpression(string equation)
        {
            Dictionary<string, Func<string, string, float>> operations = new Dictionary<string, Func<string, string, float>>
  {
    { "+", (a, b) => float.Parse(a) + float.Parse(b) },
    { "-", (a, b) => float.Parse(a) - float.Parse(b) },
    { "*", (a, b) => float.Parse(a) * float.Parse(b) },
    { "/", (a, b) => float.Parse(a) / float.Parse(b) },
    { "^", (a, b) => (float)Math.Pow(float.Parse(a), float.Parse(b)) },
    { "%", (a, b) => float.Parse(a) % float.Parse(b) },
    { "=", (a, b) => a == b ? 1 : 0 },
    { "?", (a, b) => float.Parse(a) != 0 ? float.Parse(b.Split(':')[0]) : float.Parse(b.Split(':')[1]) }
  };
            equation = equation.Replace(" ", "");
            List<string> tokens = Regex.Matches(equation, "[^0-9]|[0-9.:]+").Cast<Match>().Select(m => m.Value).ToList();

            if (tokens[0] == "-")
            {
                tokens[1] = "-" + tokens[1];
                tokens.RemoveAt(0);
            }

            for (int i = 0; i < tokens.Count; i++)
            {
                string token = tokens[i];
                if (operations.ContainsKey(token))
                {
                    string a = tokens[i - 1];
                    string b;
                    if (tokens[i+1] == "-")
                        b = "-" + tokens[i + 2];
                    else
                        b = tokens[i + 1];
                    tokens[i + 1] = operations[token](a, b).ToString();
                }
            }

            return float.Parse(tokens[tokens.Count - 1]);
        }
    }
}
