﻿using System;
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
