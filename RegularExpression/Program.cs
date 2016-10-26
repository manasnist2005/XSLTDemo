using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace RegularExpression
{
    class Program
    {
        static void Main(string[] args)
        {
            //Example1();
            Example2();
            //Example3();
        }

        //Pattern: The Regex uses a pattern that indicates one or more digits.The characters "55" match this pattern.
        private static void Example1()
        {
            Regex regex = new Regex(@"\d+");
            Match match = regex.Match("Dot 55  Perls");
            if (match.Success)
            {
                Console.WriteLine(match.Value);
            }
        }

        /*
          Static method. Here we match parts of a string (a file name in a directory path). We only accept ranges of characters and some punctuation. On Success, we access the group.
            Static:
            We use the Regex.Match static method. It is also possible to call Match upon a Regex object.
            Success:
            We test the result of Match with the Success property. When true, a Match occurred and we can access its Value or Groups.
            Groups:
            This collection is indexed at 1, not zero—the first group is found at index 1. This is important to remember.
         */
        private static void Example2()
        {
            // First we see the input string.
            string input = "/content/alTerNatjkje-1778.aspx";

            // Here we call Regex.Match.
            Match match = Regex.Match(input, @"content/([a-z0-9\-]+)\.aspx",
                RegexOptions.IgnoreCase);

            // Here we check the Match instance.
            if (match.Success)
            {
                // Finally, we get the Group value and display it.
                string key = match.Groups[1].Value;
                Console.WriteLine(key);
            }
        }

        private static void Example3()
        {
            string value = "4 AND 5";
            
            // Get first match.
            Match match = Regex.Match(value, @"\d");
            if (match.Success)
            {
                Console.WriteLine(match.Value);
            }

            // Get second match.
            match = match.NextMatch();
            if (match.Success)
            {
                Console.WriteLine(match.Value);
            }
        }

       
   
    }
}
