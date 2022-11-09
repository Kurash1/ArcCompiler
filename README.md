# ArcCompiler

compiler be in bin\Release\Arc 4.exe

The Arc.exe file, must be in the same folder as your .mod file, the common\event_modifiers\ and localisation\english\ directories must exist so that arc can write modifier and localisation files. When you run the Arc.exe it will transpile all the .arc files into eu4 script and write them to .txt files of the same name, all localisations will be written to a file called arc_l_english.yml and all modifiers will be written to a file called arc.txt, if you get errors you can either message me or try looking at the transpilers code yourself.

Now let's get into the different keywords/othershit you have in arc.
```
arc_modifier = {
      id = <the id you want to save the modifier under, will also be used for localisations>
      type = <country/ruler(<duration>) without () it's -1>
      name = "<the name of the modifier in quotes>"
      desc = "<the desc of the modifier in quotes>"
      modifiers = {
            <here you can list all of the modifiers>
      }
} #Arc modifier only really exists cus I needed it for the artifact system, though it's still slightly better way to write modifiers
var <key> = <value> #Variables, note that they will be made into static thingy thing things once transpiled
CB8, ALE = { } #Multiple scopes
(<expression>) #Math
defineloc <localisation key> = "<what to localise>" #Allows you to define localisation in code
for i = 0 to 8 = { } #hololololo for loops finally
using "<relative path from arc.exe>" as <classname> #this allows you to open a class definition file as classes
foreach <classname> = { } #this iterates through every object in a class you can access the properties like this classname.propertyname
<classname>.<insantceid>.<propertyid> #way to access any 1 object, could actually be used to store a bunch of different functions in a class
<variable name> #gets you the value of a variable
