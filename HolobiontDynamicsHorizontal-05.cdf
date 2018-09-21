(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 11.3' *)

(***************************************************************************)
(*                                                                         *)
(*                                                                         *)
(*  Under the Wolfram FreeCDF terms of use, this file and its content are  *)
(*  bound by the Creative Commons BY-SA Attribution-ShareAlike license.    *)
(*                                                                         *)
(*        For additional information concerning CDF licensing, see:        *)
(*                                                                         *)
(*         www.wolfram.com/cdf/adopting-cdf/licensing-options.html         *)
(*                                                                         *)
(*                                                                         *)
(***************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1088,         20]
NotebookDataLength[     65407,       1370]
NotebookOptionsPosition[     65556,       1360]
NotebookOutlinePosition[     65912,       1376]
CellTagsIndexPosition[     65869,       1373]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 RowBox[{"(*", " ", 
  RowBox[{
   RowBox[{"HolobiontDynamicsHorizontal", "-", "05"}], ",", " ", 
   RowBox[{"September", " ", "18"}], ",", " ", 
   RowBox[{"2018.", " ", "Note"}], ",", " ", "H", ",", " ", "HT", ",", " ", 
   "GT", ",", 
   RowBox[{
   "and", " ", "TimeToExtinction", " ", "\[IndentingNewLine]", "are", " ", 
    "global", " ", "at", " ", "this", " ", "point", " ", "to", " ", "allow", 
    " ", "code", " ", "development", " ", "based", " ", "on", " ", "latest", 
    " ", "value", " ", "of", " ", "these", " ", "variables"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"Copyright", " ", "by", " ", "Joan", " ", "Rougharden"}]}], " ", 
  "*)"}]], "Input",
 CellChangeTimes->CompressedData["
1:eJxTTMoPSmViYGAQBmIQ/eKeSV//o9eOW6saZoJoFvXOxSA6KCxlCYh+l71t
K+/j1449pXO3gWh2NcmrVkB61wV1MG0UuS4oFUi/id0BpsteMST1AuknOnxg
mk2GKy7m2WtHpROrkkA0E9+WU91AuqHwMJg+pMhRvAFIqwSElIBoq+Z3YczP
Xzsec/gJpp+c9d+nA6S/beQ4BKJXaRyvWweks866NYJoCw/JMwwvXjv+FBa7
AqIvMZZHsgBpOekZYNqN+2qMNpCWeesbC6K76uxuhgDpONnDYHoBV4lW9cvX
jrPYN2mD6Bk1PktA9L0i1mUgurDhzjoQPaeNaz2IBgAAlKUJ
  "],
 CellLabel->"In[5]:=",ExpressionUUID->"14bf564c-a17f-4de0-8377-0ca28270b31e"],

Cell[BoxData[
 RowBox[{"ClearAll", "[", "\"\<Global`*\>\"", "]"}]], "Input",
 CellOpen->False,
 CellLabel->"In[6]:=",ExpressionUUID->"9e7a2b49-8641-463d-94e7-51e2f062a5cb"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"HolobiontDynamicsHorizontal", "[", 
    RowBox[{
    "tM_", ",", "tm_", ",", "r_", ",", "K_", ",", " ", "W0_", ",", "WK_", ",",
      "Init_", ",", "DisplayOption_"}], "]"}], ":=", "\[IndentingNewLine]", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", " ", 
      RowBox[{"F", ",", "Fiterate", ",", "nprimeprime", ",", " ", 
       RowBox[{"(*", " ", 
        RowBox[{"HT", ",", "GT", ","}], "*)"}], " ", "MU", ",", "MUinit", ",",
        " ", "nprime", ",", "Hprime", ",", "Hprimeprime", ",", "W", ",", 
       RowBox[{"(*", " ", 
        RowBox[{"TimeToExtinction", ","}], " ", "*)"}], " ", "ShortFall", ",",
        "HolobiontFitnessPlot", ",", "HolobiontNumberPlot", ",", " ", 
       "SymbiontNumberPlot", ",", "\[IndentingNewLine]", "ChartColor", ",", 
       " ", "HostPopulationColor", ",", "GuestPopulationColor", ",", 
       "HCharts", ",", "HGraphsGrid", ",", "PictureGridList"}], " ", 
      RowBox[{"(*", " ", 
       RowBox[{",", " ", "H"}], " ", "*)"}], " ", "}"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"Init", "\[Equal]", "1"}], ",", 
        RowBox[{"Hinit", "=", 
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"K", "+", "1", "-", "n"}], ")"}], ",", 
           RowBox[{"{", 
            RowBox[{"n", ",", "0", ",", "K"}], "}"}]}], "]"}]}], ",", " ", 
        "\[IndentingNewLine]", 
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{"Init", "\[Equal]", "2"}], ",", 
          RowBox[{"Hinit", "=", 
           RowBox[{"Table", "[", 
            RowBox[{"10", ",", 
             RowBox[{"{", 
              RowBox[{"n", ",", "0", ",", "K"}], "}"}]}], "]"}]}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{"If", "[", 
           RowBox[{
            RowBox[{"Init", "\[Equal]", "3"}], ",", " ", 
            RowBox[{"Hinit", "=", 
             RowBox[{"Table", "[", 
              RowBox[{"n", " ", ",", 
               RowBox[{"{", 
                RowBox[{"n", ",", "0", ",", "K"}], "}"}]}], "]"}]}], ",", 
            RowBox[{"H", "=", 
             RowBox[{"Table", "[", 
              RowBox[{"0", ",", 
               RowBox[{"{", 
                RowBox[{"n", ",", "0", ",", "K"}], "}"}]}], "]"}]}]}], 
           "\[IndentingNewLine]", "]"}]}], "]"}]}], "]"}], ";", 
      "\[IndentingNewLine]", " ", 
      RowBox[{"HTinit", "=", 
       RowBox[{"Total", "[", "Hinit", "]"}]}], ";", "\[IndentingNewLine]", 
      " ", 
      RowBox[{"GTinit", "=", 
       RowBox[{"Sum", "[", 
        RowBox[{
         RowBox[{"n", "*", 
          RowBox[{"Hinit", "[", 
           RowBox[{"[", 
            RowBox[{"n", "+", "1"}], "]"}], "]"}]}], ",", 
         RowBox[{"{", 
          RowBox[{"n", ",", "0", ",", "K"}], "}"}]}], "]"}]}], ";", 
      "\[IndentingNewLine]", " ", 
      RowBox[{"MUinit", "=", 
       RowBox[{"GTinit", "/", "HTinit"}]}], ";", "\[IndentingNewLine]", " ", 
      RowBox[{"HT", "=", 
       RowBox[{"{", "HTinit", "}"}]}], ";", "\[IndentingNewLine]", " ", 
      RowBox[{"GT", "=", 
       RowBox[{"{", "GTinit", "}"}]}], ";", "\n", "         ", 
      RowBox[{"H", "=", 
       RowBox[{"{", 
        RowBox[{"Round", "[", " ", 
         RowBox[{
          RowBox[{"N", "[", 
           RowBox[{
            RowBox[{"Table", "[", 
             RowBox[{
              RowBox[{"PDF", "[", 
               RowBox[{
                RowBox[{"PoissonDistribution", "[", "MUinit", "]"}], ",", 
                "n"}], "]"}], ",", 
              RowBox[{"{", 
               RowBox[{"n", ",", "0", ",", "K"}], "}"}]}], "]"}], "/", 
            RowBox[{"N", "[", 
             RowBox[{"CDF", "[", 
              RowBox[{
               RowBox[{"PoissonDistribution", "[", "MUinit", "]"}], ",", 
               "K"}], "]"}], "]"}]}], "]"}], "*", "HTinit"}], "]"}], "}"}]}], 
      ";", "\[IndentingNewLine]", " ", 
      RowBox[{
       RowBox[{"F", "[", "n_", "]"}], ":=", " ", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"1", "+", "r", " ", "-", 
          RowBox[{"r", "*", 
           RowBox[{"n", "/", "K"}]}]}], ")"}], "*", "n"}]}], " ", ";", "\n", 
      "        ", 
      RowBox[{
       RowBox[{"Fiterate", "[", "n_", "]"}], ":=", " ", 
       RowBox[{"Simplify", "[", 
        RowBox[{"Nest", "[", 
         RowBox[{"F", ",", "n", ",", "tm"}], "]"}], "]"}]}], ";", "\n", 
      "        ", 
      RowBox[{"nprimeprime", "=", 
       RowBox[{"Table", "[", 
        RowBox[{
         RowBox[{"Round", "[", 
          RowBox[{"Fiterate", "[", "n", "]"}], "]"}], ",", 
         RowBox[{"{", 
          RowBox[{"n", ",", "0", ",", "K"}], "}"}]}], "]"}]}], ";", "\n", 
      "        ", 
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"K", ">", "0"}], ",", 
        RowBox[{"W", "=", 
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{"W0", "+", 
            RowBox[{
             RowBox[{"(", 
              RowBox[{
               RowBox[{"(", 
                RowBox[{"WK", "-", "W0"}], ")"}], "/", "K"}], ")"}], "*", 
             "n"}]}], ",", 
           RowBox[{"{", 
            RowBox[{"n", ",", "0", ",", "K"}], "}"}]}], "]"}]}], ",", 
        RowBox[{"W", "=", 
         RowBox[{"Table", "[", 
          RowBox[{"0", ",", 
           RowBox[{"{", 
            RowBox[{"n", ",", "0", ",", "K"}], "}"}]}], "]"}]}]}], "]"}], ";",
       "\[IndentingNewLine]", " ", 
      RowBox[{"For", "[", 
       RowBox[{
        RowBox[{"t", "=", "1"}], ",", 
        RowBox[{
         RowBox[{"t", "\[LessEqual]", "tM"}], " ", "&&", " ", 
         RowBox[{
          RowBox[{"HT", "[", 
           RowBox[{"[", "t", "]"}], "]"}], ">", "0"}], " ", "&&", " ", 
         RowBox[{
          RowBox[{"GT", "[", 
           RowBox[{"[", "t", "]"}], "]"}], ">", "0"}]}], ",", 
        RowBox[{"++", "t"}], ",", "\[IndentingNewLine]", "     ", 
        RowBox[{
         RowBox[{"MU", "=", 
          RowBox[{
           RowBox[{"GT", "[", 
            RowBox[{"[", "t", "]"}], "]"}], "/", 
           RowBox[{"HT", "[", 
            RowBox[{"[", "t", "]"}], "]"}]}]}], ";", "\[IndentingNewLine]", 
         "     ", 
         RowBox[{"Hprime", "=", " ", 
          RowBox[{"Round", "[", 
           RowBox[{
            RowBox[{"N", "[", 
             RowBox[{
              RowBox[{"Table", "[", 
               RowBox[{
                RowBox[{"PDF", "[", 
                 RowBox[{
                  RowBox[{"PoissonDistribution", "[", "MU", "]"}], ",", "n"}],
                  "]"}], ",", 
                RowBox[{"{", 
                 RowBox[{"n", ",", "0", ",", "K"}], "}"}]}], "]"}], "/", 
              RowBox[{"N", "[", 
               RowBox[{"CDF", "[", 
                RowBox[{
                 RowBox[{"PoissonDistribution", "[", "MU", "]"}], ",", "K"}], 
                "]"}], "]"}]}], "]"}], "*", 
            RowBox[{"HT", "[", 
             RowBox[{"[", "t", "]"}], "]"}]}], "]"}]}], ";", 
         "\[IndentingNewLine]", "    ", 
         RowBox[{"Hprimeprime", "=", 
          RowBox[{"Table", "[", 
           RowBox[{
            RowBox[{"Total", "[", 
             RowBox[{"Hprime", "[", 
              RowBox[{"[", 
               RowBox[{"Flatten", "[", 
                RowBox[{"Position", "[", 
                 RowBox[{"nprimeprime", ",", "n"}], "]"}], "]"}], "]"}], 
              "]"}], "]"}], ",", 
            RowBox[{"{", 
             RowBox[{"n", ",", "0", ",", "K"}], " ", "}"}]}], "]"}]}], ";", 
         "\n", "              ", 
         RowBox[{"H", "=", 
          RowBox[{"Append", "[", 
           RowBox[{"H", ",", 
            RowBox[{"Round", "[", 
             RowBox[{"W", "*", "Hprimeprime"}], "]"}]}], "]"}]}], ";", "\n", 
         "              ", 
         RowBox[{"HT", "=", 
          RowBox[{"Append", "[", 
           RowBox[{"HT", ",", 
            RowBox[{"Total", "[", 
             RowBox[{"H", "[", 
              RowBox[{"[", 
               RowBox[{"t", "+", "1"}], "]"}], "]"}], "]"}]}], " ", "]"}]}], 
         ";", "\n", "              ", 
         RowBox[{"GT", "=", 
          RowBox[{"Append", "[", 
           RowBox[{"GT", ",", 
            RowBox[{"Sum", "[", 
             RowBox[{
              RowBox[{"n", "*", 
               RowBox[{"H", "[", 
                RowBox[{"[", 
                 RowBox[{
                  RowBox[{"t", "+", "1"}], ",", 
                  RowBox[{"n", "+", "1"}]}], "]"}], "]"}]}], ",", 
              RowBox[{"{", 
               RowBox[{"n", ",", "0", ",", "K"}], "}"}]}], "]"}]}], "]"}]}], 
         ";"}]}], "\[IndentingNewLine]", " ", "]"}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{"H", "=", 
       RowBox[{"Append", "[", 
        RowBox[{"H", ",", 
         RowBox[{"{", 
          RowBox[{"tM", ",", "tm", ",", "r", ",", "K", ",", "W0", ",", "WK"}],
           "}"}]}], "]"}]}], ";", "\[IndentingNewLine]", 
      "\[IndentingNewLine]", 
      RowBox[{"(*", " ", 
       RowBox[{"--", 
        RowBox[{"--", 
         RowBox[{"--", 
          RowBox[{"--", 
           RowBox[{"--", 
            RowBox[{"--", 
             RowBox[{"--", 
              RowBox[{"--", 
               RowBox[{"--", 
                RowBox[{"--", 
                 RowBox[{"--", 
                  RowBox[{"--", 
                   RowBox[{"--", 
                    RowBox[{"--", 
                    RowBox[{"--", 
                    RowBox[{"--", 
                    RowBox[{"--", 
                    RowBox[{"--", 
                    RowBox[{"--", 
                    RowBox[{"--", 
                    RowBox[{"--", 
                    RowBox[{"--", 
                    RowBox[{"--", 
                    RowBox[{
                    "--", "--"}]}]}]}]}]}]}]}]}]}]}]}]}]}]}]}]}]}]}]}]}]}]}]}]\
, " ", "*)"}], "\[IndentingNewLine]", 
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"DisplayOption", "\[Equal]", "1"}], ",", 
        RowBox[{"TableForm", "[", "H", "]"}], ",", "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{"WK", ">", "W0"}], ",", 
           RowBox[{"ChartColor", "=", 
            RowBox[{"RGBColor", "[", 
             RowBox[{"0", ",", "1", ",", "0", ",", "1"}], "]"}]}], ",", 
           "\[IndentingNewLine]", 
           RowBox[{"If", "[", 
            RowBox[{
             RowBox[{"WK", "<", "W0"}], ",", 
             RowBox[{"ChartColor", "=", 
              RowBox[{"RGBColor", "[", 
               RowBox[{".6", ",", ".4", ",", ".2", ",", "1"}], "]"}]}], ",", 
             "\[IndentingNewLine]", 
             RowBox[{"If", "[", 
              RowBox[{
               RowBox[{"WK", "\[Equal]", "W0"}], ",", 
               RowBox[{"ChartColor", "=", 
                RowBox[{"RGBColor", "[", 
                 RowBox[{"0", ",", "0", ",", "0", ",", "1"}], "]"}]}]}], 
              "]"}]}], "]"}]}], "]"}], ";", "\[IndentingNewLine]", 
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"Length", "[", "H", "]"}], " ", "<", " ", 
            RowBox[{"tM", "+", "1"}]}], ",", " ", 
           RowBox[{"TimeToExtinction", "=", 
            RowBox[{
             RowBox[{"Length", "[", "H", "]"}], "-", "1"}]}], ",", 
           "\[IndentingNewLine]", 
           RowBox[{
            RowBox[{"TimeToExtinction", "=", "0"}], ";", 
            RowBox[{"For", "[", 
             RowBox[{
              RowBox[{"t", "=", "0"}], ",", 
              RowBox[{"t", "<=", "tM"}], ",", 
              RowBox[{"++", "t"}], ",", 
              RowBox[{"If", "[", 
               RowBox[{
                RowBox[{
                 RowBox[{"HT", "[", 
                  RowBox[{"[", 
                   RowBox[{"t", "+", "1"}], "]"}], "]"}], ">", "0"}], ",", 
                " ", 
                RowBox[{"++", "TimeToExtinction"}]}], "]"}]}], "]"}]}]}], " ",
           "]"}], ";", " ", 
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"HT", "[", 
             RowBox[{"[", "TimeToExtinction", "]"}], "]"}], "\[Equal]", "0"}],
            ",", 
           RowBox[{"--", "TimeToExtinction"}]}], "]"}], ";", 
         "\[IndentingNewLine]", 
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"HT", "[", 
             RowBox[{"[", "1", "]"}], "]"}], " ", ">", " ", 
            RowBox[{"HT", "[", 
             RowBox[{"[", "TimeToExtinction", "]"}], "]"}]}], ",", " ", 
           RowBox[{"HostPopulationColor", "=", 
            RowBox[{"RGBColor", "[", 
             RowBox[{"1", ",", "0", ",", "0", ",", "1"}], "]"}]}], ",", 
           "\[IndentingNewLine]", 
           RowBox[{"If", "[", 
            RowBox[{
             RowBox[{
              RowBox[{"HT", "[", 
               RowBox[{"[", "1", "]"}], "]"}], " ", "<", " ", 
              RowBox[{"HT", "[", 
               RowBox[{"[", "TimeToExtinction", "]"}], "]"}]}], ",", 
             RowBox[{"HostPopulationColor", "=", 
              RowBox[{"RGBColor", "[", 
               RowBox[{"0", ",", "0", ",", "1", ",", "1"}], "]"}]}], ",", " ",
              "\[IndentingNewLine]", 
             RowBox[{"If", "[", 
              RowBox[{
               RowBox[{
                RowBox[{"HT", "[", 
                 RowBox[{"[", "1", "]"}], "]"}], " ", "==", " ", 
                RowBox[{"HT", "[", 
                 RowBox[{"[", "TimeToExtinction", "]"}], "]"}]}], ",", 
               RowBox[{"HostPopulationColor", "=", 
                RowBox[{"RGBColor", "[", 
                 RowBox[{"0", ",", "0", ",", "0", ",", "1"}], "]"}]}]}], 
              "]"}]}], "]"}]}], "]"}], ";", "\[IndentingNewLine]", 
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"GT", "[", 
             RowBox[{"[", "1", "]"}], "]"}], " ", ">", " ", 
            RowBox[{"GT", "[", 
             RowBox[{"[", "TimeToExtinction", "]"}], "]"}]}], ",", " ", 
           RowBox[{"GuestPopulationColor", "=", 
            RowBox[{"RGBColor", "[", 
             RowBox[{"1", ",", "0", ",", "0", ",", "1"}], "]"}]}], ",", 
           "\[IndentingNewLine]", 
           RowBox[{"If", "[", 
            RowBox[{
             RowBox[{
              RowBox[{"GT", "[", 
               RowBox[{"[", "1", "]"}], "]"}], " ", "<", " ", 
              RowBox[{"GT", "[", 
               RowBox[{"[", "TimeToExtinction", "]"}], "]"}]}], ",", 
             RowBox[{"GuestPopulationColor", "=", 
              RowBox[{"RGBColor", "[", 
               RowBox[{"0", ",", "0", ",", "1", ",", "1"}], "]"}]}], ",", " ",
              "\[IndentingNewLine]", 
             RowBox[{"If", "[", 
              RowBox[{
               RowBox[{
                RowBox[{"GT", "[", 
                 RowBox[{"[", "1", "]"}], "]"}], " ", "==", " ", 
                RowBox[{"GT", "[", 
                 RowBox[{"[", "TimeToExtinction", "]"}], "]"}]}], ",", 
               RowBox[{"GuestPopulationColor", "=", 
                RowBox[{"RGBColor", "[", 
                 RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "]"}]}]}], 
              "]"}]}], "]"}]}], "]"}], ";", " ", "\[IndentingNewLine]", " ", 
         RowBox[{"HolobiontFitnessPlot", "=", 
          RowBox[{"ListLinePlot", "[", 
           RowBox[{
            RowBox[{"Table", "[", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{"n", ",", 
                RowBox[{"W", "[", 
                 RowBox[{"[", 
                  RowBox[{"n", "+", "1"}], "]"}], "]"}]}], "}"}], ",", 
              RowBox[{"{", 
               RowBox[{"n", ",", "0", ",", "K"}], "}"}]}], "]"}], ",", 
            RowBox[{"Frame", "\[Rule]", "True"}], ",", 
            RowBox[{"PlotLabel", "\[Rule]", "\"\<Holobiont Fitness\>\""}], 
            ",", 
            RowBox[{"FrameLabel", "\[Rule]", 
             RowBox[{"{", 
              RowBox[{"\"\<Symbont Number, n\>\"", ",", "\"\<W(n)\>\""}], 
              "}"}]}], ",", 
            RowBox[{"PlotStyle", "\[Rule]", "ChartColor"}]}], "]"}]}], ";", 
         "\[IndentingNewLine]", "     ", 
         RowBox[{"HolobiontNumberPlot", "=", 
          RowBox[{"ListLinePlot", "[", 
           RowBox[{
            RowBox[{"Table", "[", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{
                RowBox[{"t", "-", "1"}], ",", 
                RowBox[{"Log10", "[", 
                 RowBox[{"HT", "[", 
                  RowBox[{"[", "t", "]"}], "]"}], "]"}]}], "}"}], ",", 
              RowBox[{"{", 
               RowBox[{"t", ",", "1", ",", "TimeToExtinction"}], "}"}]}], 
             "]"}], ",", 
            RowBox[{"PlotRange", "\[Rule]", 
             RowBox[{"{", 
              RowBox[{
               RowBox[{"{", 
                RowBox[{"0", ",", 
                 RowBox[{"TimeToExtinction", "-", "1"}]}], "}"}], ",", 
               "All"}], "}"}]}], ",", 
            RowBox[{"Frame", "\[Rule]", "True"}], ",", 
            RowBox[{"PlotLabel", "\[Rule]", "\"\<Holobiont Number\>\""}], ",", 
            RowBox[{"FrameLabel", "\[Rule]", 
             RowBox[{"{", 
              RowBox[{"\"\<Time\>\"", ",", "\"\<Log10[HT(t)]\>\""}], "}"}]}], 
            ",", 
            RowBox[{"PlotStyle", "\[Rule]", "HostPopulationColor"}]}], 
           "]"}]}], ";", "\[IndentingNewLine]", "     ", 
         RowBox[{"SymbiontNumberPlot", "=", 
          RowBox[{"ListLinePlot", "[", 
           RowBox[{
            RowBox[{"Table", "[", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{
                RowBox[{"t", "-", "1"}], ",", 
                RowBox[{"Log10", "[", 
                 RowBox[{"GT", "[", 
                  RowBox[{"[", "t", "]"}], "]"}], "]"}]}], "}"}], ",", 
              RowBox[{"{", 
               RowBox[{"t", ",", "1", ",", "TimeToExtinction"}], "}"}]}], 
             "]"}], ",", 
            RowBox[{"PlotRange", "\[Rule]", 
             RowBox[{"{", 
              RowBox[{
               RowBox[{"{", 
                RowBox[{"0", ",", 
                 RowBox[{"TimeToExtinction", "-", "1"}]}], "}"}], ",", 
               "All"}], "}"}]}], ",", 
            RowBox[{"Frame", "\[Rule]", "True"}], ",", 
            RowBox[{"PlotLabel", "\[Rule]", "\"\<Microbe Number\>\""}], ",", 
            RowBox[{"FrameLabel", "\[Rule]", 
             RowBox[{"{", 
              RowBox[{"\"\<Time\>\"", ",", "\"\<Log10[GT(t)]\>\""}], "}"}]}], 
            ",", 
            RowBox[{"PlotStyle", "\[Rule]", "GuestPopulationColor"}]}], 
           "]"}]}], ";", "\[IndentingNewLine]", 
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{"DisplayOption", "\[Equal]", "2"}], ",", 
           "\[IndentingNewLine]", 
           RowBox[{
            RowBox[{"HCharts", " ", "=", " ", 
             RowBox[{"Table", "[", 
              RowBox[{
               RowBox[{"BarChart", "[", 
                RowBox[{
                 RowBox[{
                  RowBox[{"H", "[", 
                   RowBox[{"[", "t", "]"}], "]"}], "/", 
                  RowBox[{"HT", "[", 
                   RowBox[{"[", "t", "]"}], "]"}]}], ",", 
                 RowBox[{"ImageSize", "\[Rule]", "Small"}], ",", " ", 
                 RowBox[{"PlotLabel", "\[Rule]", 
                  RowBox[{"StringForm", "[", 
                   RowBox[{"\"\<t = ``\>\"", ",", 
                    RowBox[{"(", 
                    RowBox[{"t", "-", "1"}], ")"}]}], "]"}]}], ",", 
                 RowBox[{"ChartStyle", "\[Rule]", "ChartColor"}]}], "]"}], 
               ",", 
               RowBox[{"{", 
                RowBox[{"t", ",", "1", ",", "TimeToExtinction"}], "}"}]}], 
              "]"}]}], ";", "\[IndentingNewLine]", 
            RowBox[{"HGraphsGrid", "=", 
             RowBox[{"GraphicsGrid", "[", 
              RowBox[{
               RowBox[{"Prepend", "[", 
                RowBox[{
                 RowBox[{"Table", "[", 
                  RowBox[{
                   RowBox[{"Table", "[", 
                    RowBox[{
                    RowBox[{"HCharts", "[", 
                    RowBox[{"[", 
                    RowBox[{"t", "+", 
                    RowBox[{"3", "*", 
                    RowBox[{"(", 
                    RowBox[{"row", "-", "1"}], ")"}]}]}], "]"}], "]"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"t", ",", "1", ",", "3"}], "}"}]}], "]"}], ",", 
                   RowBox[{"{", 
                    RowBox[{"row", ",", "1", ",", 
                    RowBox[{"Floor", "[", 
                    RowBox[{"TimeToExtinction", "/", "3"}], "]"}]}], "}"}]}], 
                  "]"}], ",", 
                 RowBox[{"{", 
                  RowBox[{
                  "HolobiontNumberPlot", ",", "SymbiontNumberPlot", ",", 
                   "HolobiontFitnessPlot"}], "}"}]}], "]"}], ",", 
               RowBox[{"Frame", "->", "True"}]}], "]"}]}]}], ",", 
           "\[IndentingNewLine]", 
           RowBox[{"If", "[", 
            RowBox[{
             RowBox[{"DisplayOption", "\[Equal]", "3"}], ",", 
             "\[IndentingNewLine]", 
             RowBox[{
              RowBox[{"If", "[", 
               RowBox[{
                RowBox[{"WK", ">", "W0"}], ",", " ", 
                RowBox[{"PictureGridList", "=", 
                 RowBox[{"Table", "[", 
                  RowBox[{
                   RowBox[{"Graphics", "[", 
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"EdgeForm", "[", "Thick", "]"}], ",", 
                    RowBox[{"RGBColor", "[", 
                    RowBox[{"0", ",", "1", ",", "0", ",", 
                    RowBox[{
                    RowBox[{"Sum", "[", 
                    RowBox[{
                    RowBox[{"n", "*", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"H", "[", 
                    RowBox[{"[", "t", "]"}], "]"}], "[", 
                    RowBox[{"[", "n", "]"}], "]"}], "/", 
                    RowBox[{"HT", "[", 
                    RowBox[{"[", "t", "]"}], "]"}]}]}], ",", 
                    RowBox[{"{", 
                    RowBox[{"n", ",", "0", ",", "K"}], "}"}]}], "]"}], "/", 
                    "K"}]}], "]"}], ",", 
                    RowBox[{"Rectangle", "[", 
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"0", ",", "0"}], "}"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"1", ",", "1"}], "}"}], ",", 
                    RowBox[{"RoundingRadius", "\[Rule]", 
                    RowBox[{"1", "/", "4"}]}]}], "]"}]}], "}"}], ",", 
                    RowBox[{"PlotLabel", "\[Rule]", 
                    RowBox[{"StringForm", "[", 
                    RowBox[{"\"\<t = ``\>\"", ",", 
                    RowBox[{"(", 
                    RowBox[{"t", "-", "1"}], ")"}]}], "]"}]}]}], "]"}], ",", 
                   RowBox[{"{", 
                    RowBox[{"t", ",", "1", ",", "TimeToExtinction"}], "}"}]}],
                   "]"}]}], ",", "\[IndentingNewLine]", 
                RowBox[{"If", "[", 
                 RowBox[{
                  RowBox[{"WK", "<", "W0"}], ",", " ", 
                  RowBox[{"PictureGridList", "=", 
                   RowBox[{"Table", "[", 
                    RowBox[{
                    RowBox[{"Graphics", "[", 
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"EdgeForm", "[", "Thick", "]"}], ",", 
                    RowBox[{"RGBColor", "[", 
                    RowBox[{".6", ",", ".4", ",", ".2", ",", 
                    RowBox[{
                    RowBox[{"Sum", "[", 
                    RowBox[{
                    RowBox[{"n", "*", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"H", "[", 
                    RowBox[{"[", "t", "]"}], "]"}], "[", 
                    RowBox[{"[", "n", "]"}], "]"}], "/", 
                    RowBox[{"HT", "[", 
                    RowBox[{"[", "t", "]"}], "]"}]}]}], ",", 
                    RowBox[{"{", 
                    RowBox[{"n", ",", "0", ",", "K"}], "}"}]}], "]"}], "/", 
                    "K"}]}], "]"}], ",", 
                    RowBox[{"Rectangle", "[", 
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"0", ",", "0"}], "}"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"1", ",", "1"}], "}"}], ",", 
                    RowBox[{"RoundingRadius", "\[Rule]", 
                    RowBox[{"1", "/", "4"}]}]}], "]"}]}], "}"}], ",", 
                    RowBox[{"PlotLabel", "\[Rule]", 
                    RowBox[{"StringForm", "[", 
                    RowBox[{"\"\<t = ``\>\"", ",", 
                    RowBox[{"(", 
                    RowBox[{"t", "-", "1"}], ")"}]}], "]"}]}]}], "]"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"t", ",", "1", ",", "TimeToExtinction"}], "}"}]}],
                     "]"}]}], ",", "\[IndentingNewLine]", 
                  RowBox[{"If", "[", 
                   RowBox[{
                    RowBox[{"WK", "\[Equal]", "W0"}], ",", " ", 
                    RowBox[{"PictureGridList", "=", 
                    RowBox[{"Table", "[", 
                    RowBox[{
                    RowBox[{"Graphics", "[", 
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"EdgeForm", "[", "Thick", "]"}], ",", 
                    RowBox[{"RGBColor", "[", 
                    RowBox[{"0", ",", "0", ",", "0", ",", 
                    RowBox[{
                    RowBox[{"Sum", "[", 
                    RowBox[{
                    RowBox[{"n", "*", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"H", "[", 
                    RowBox[{"[", "t", "]"}], "]"}], "[", 
                    RowBox[{"[", "n", "]"}], "]"}], "/", 
                    RowBox[{"HT", "[", 
                    RowBox[{"[", "t", "]"}], "]"}]}]}], ",", 
                    RowBox[{"{", 
                    RowBox[{"n", ",", "0", ",", "K"}], "}"}]}], "]"}], "/", 
                    "K"}]}], "]"}], ",", 
                    RowBox[{"Rectangle", "[", 
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"0", ",", "0"}], "}"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"1", ",", "1"}], "}"}], ",", 
                    RowBox[{"RoundingRadius", "\[Rule]", 
                    RowBox[{"1", "/", "4"}]}]}], "]"}]}], "}"}], ",", 
                    RowBox[{"PlotLabel", "\[Rule]", 
                    RowBox[{"StringForm", "[", 
                    RowBox[{"\"\<t = ``\>\"", ",", 
                    RowBox[{"(", 
                    RowBox[{"t", "-", "1"}], ")"}]}], "]"}]}]}], "]"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"t", ",", "1", ",", "TimeToExtinction"}], "}"}]}],
                     "]"}]}]}], "]"}]}], "]"}]}], "]"}], ";", 
              "\[IndentingNewLine]", 
              RowBox[{"GraphicsGrid", "[", 
               RowBox[{
                RowBox[{"Prepend", "[", 
                 RowBox[{
                  RowBox[{"Table", "[", 
                   RowBox[{
                    RowBox[{"Table", "[", 
                    RowBox[{
                    RowBox[{"PictureGridList", "[", 
                    RowBox[{"[", 
                    RowBox[{"t", "+", 
                    RowBox[{"3", "*", 
                    RowBox[{"(", 
                    RowBox[{"row", "-", "1"}], ")"}]}]}], "]"}], "]"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"t", ",", "1", ",", "3"}], "}"}]}], "]"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"row", ",", "1", ",", 
                    RowBox[{"Floor", "[", 
                    RowBox[{"TimeToExtinction", "/", "3"}], "]"}]}], "}"}]}], 
                   "]"}], ",", 
                  RowBox[{"{", 
                   RowBox[{
                   "HolobiontNumberPlot", ",", "SymbiontNumberPlot", ",", 
                    "HolobiontFitnessPlot"}], "}"}]}], "]"}], ",", 
                RowBox[{"Frame", "\[Rule]", "True"}]}], "]"}]}]}], 
            "\[IndentingNewLine]", "]"}]}], "]"}]}]}], "]"}]}]}], 
    "\[IndentingNewLine]", "]"}]}], ";"}]], "Input",
 CellOpen->False,
 CellChangeTimes->{{3.742337553500803*^9, 3.742337567314199*^9}, {
   3.74233765904926*^9, 3.742337666462199*^9}, 3.742337698198453*^9, {
   3.7423377750040293`*^9, 3.742337788479623*^9}, {3.7424074448619347`*^9, 
   3.74240750723171*^9}, {3.742407802885989*^9, 3.742407805752017*^9}, {
   3.742407996047167*^9, 3.7424080020098753`*^9}, {3.7424081419179487`*^9, 
   3.742408168748283*^9}, {3.742408793479517*^9, 3.742408890747089*^9}, {
   3.742411220670437*^9, 3.742411238050941*^9}, {3.742411382863255*^9, 
   3.742411383763239*^9}, {3.7424126858188562`*^9, 3.742412734869903*^9}, {
   3.742412779251042*^9, 3.742412789859495*^9}, {3.7424128345325413`*^9, 
   3.7424128651496363`*^9}, {3.742413121671283*^9, 3.7424131249555407`*^9}, {
   3.742413349734105*^9, 3.742413367204653*^9}, {3.742482973419203*^9, 
   3.742482976387908*^9}, {3.7424832309781513`*^9, 3.742483253971271*^9}, {
   3.742483287744117*^9, 3.742483370206814*^9}, {3.7424834188196793`*^9, 
   3.7424834337356253`*^9}, {3.742483550704081*^9, 3.742483569366086*^9}, {
   3.742483644146401*^9, 3.7424836726765957`*^9}, {3.742498506103445*^9, 
   3.742498520255062*^9}, {3.742499348939361*^9, 3.742499411286626*^9}, {
   3.742500388619623*^9, 3.742500391603052*^9}, {3.74250043257001*^9, 
   3.742500536312711*^9}, {3.742500718521167*^9, 3.742500723639077*^9}, {
   3.742500991899042*^9, 3.742501000886368*^9}, {3.742589276230445*^9, 
   3.742589348889958*^9}, {3.742589395567849*^9, 3.742589397456069*^9}, {
   3.742589428473654*^9, 3.742589479570702*^9}, {3.7425897671819887`*^9, 
   3.742589767966941*^9}, {3.742594063227343*^9, 3.742594074168165*^9}, {
   3.742594117492734*^9, 3.742594145132345*^9}, {3.742594329522708*^9, 
   3.742594332749383*^9}, {3.742594424359386*^9, 3.74259443079163*^9}, {
   3.742594472610455*^9, 3.742594493589818*^9}, {3.742594529055666*^9, 
   3.742594557186513*^9}, {3.742594705868676*^9, 3.7425947501037607`*^9}, {
   3.7425949483093367`*^9, 3.7425950548889027`*^9}, {3.74259519862178*^9, 
   3.742595225787551*^9}, {3.7425969710304003`*^9, 3.742597036785089*^9}, {
   3.74259715863665*^9, 3.74259717632099*^9}, {3.742660698754904*^9, 
   3.742660788617064*^9}, {3.742661467999271*^9, 3.742661502928535*^9}, {
   3.742661598275531*^9, 3.7426615995561666`*^9}, {3.742661782482729*^9, 
   3.742661783190798*^9}, {3.742920649553217*^9, 3.7429206967247334`*^9}, {
   3.742920744527217*^9, 3.742920791869884*^9}, 3.742921118703134*^9, {
   3.742921153486561*^9, 3.7429211627218122`*^9}, {3.742921266788292*^9, 
   3.742921274071226*^9}, 3.742921426465158*^9, 3.742921466333956*^9, {
   3.742921565730949*^9, 3.742921571603332*^9}, {3.742921699149107*^9, 
   3.742921760854765*^9}, {3.742921885946681*^9, 3.7429218868007402`*^9}, 
   3.7429219477987556`*^9, {3.7429219785461206`*^9, 3.742922001045391*^9}, {
   3.7429220538425283`*^9, 3.7429221149094477`*^9}, {3.742922199793569*^9, 
   3.742922202044012*^9}, {3.742922368614279*^9, 3.742922373168998*^9}, {
   3.742922407642084*^9, 3.742922413006298*^9}, {3.7429224703104897`*^9, 
   3.74292249440242*^9}, {3.742922996376842*^9, 3.742923022768012*^9}, {
   3.742923541436911*^9, 3.742923624933281*^9}, 3.742923728787953*^9, {
   3.7430126610966578`*^9, 3.7430126839119577`*^9}, {3.743012746215515*^9, 
   3.743012791281899*^9}, {3.743012904157302*^9, 3.743013127098781*^9}, {
   3.743013187507065*^9, 3.743013216478045*^9}, {3.743013311079486*^9, 
   3.743013316061501*^9}, {3.7430134564077*^9, 3.743013515030558*^9}, {
   3.743013919986225*^9, 3.743013938849902*^9}, {3.743015179998848*^9, 
   3.7430152606072206`*^9}, {3.743015643780603*^9, 3.743015663714861*^9}, {
   3.7430170682553673`*^9, 3.74301708879748*^9}, {3.743017244513557*^9, 
   3.743017245738282*^9}, {3.743017360393255*^9, 3.743017372382249*^9}, {
   3.743017407573194*^9, 3.743017415820613*^9}, {3.7430174468267384`*^9, 
   3.743017484871829*^9}, {3.7430175456473627`*^9, 3.7430175788913927`*^9}, {
   3.743017609773786*^9, 3.743017625387978*^9}, {3.743017663180008*^9, 
   3.743017682458816*^9}, 3.7430186445323563`*^9, {3.7430981894934464`*^9, 
   3.743098292010972*^9}, {3.743098448504528*^9, 3.743098514338457*^9}, {
   3.743098596567471*^9, 3.743098620779634*^9}, {3.743098672468316*^9, 
   3.743098699031836*^9}, {3.743098805685939*^9, 3.743098815977047*^9}, {
   3.743098869136261*^9, 3.743098871687296*^9}, {3.743098999861319*^9, 
   3.743099151064917*^9}, 3.743099198227462*^9, {3.7430992719682713`*^9, 
   3.7430992852946997`*^9}, {3.743099464258872*^9, 3.743099465269051*^9}, {
   3.7430997282093563`*^9, 3.743099739268605*^9}, {3.743099840092968*^9, 
   3.7430998843297167`*^9}, {3.743099918730427*^9, 3.743099953459584*^9}, 
   3.7431000272863083`*^9, {3.743100066119231*^9, 3.7431001094545107`*^9}, {
   3.7431001745273523`*^9, 3.7431001764164133`*^9}, 3.74310034225795*^9, {
   3.74310051988404*^9, 3.743100522931287*^9}, {3.743101455144108*^9, 
   3.743101640904682*^9}, {3.74310172395649*^9, 3.7431017948969*^9}, {
   3.7431018818615513`*^9, 3.743101901267304*^9}, {3.7431020016984673`*^9, 
   3.743102030149881*^9}, {3.74310216857306*^9, 3.743102344022819*^9}, {
   3.74310241452903*^9, 3.7431024455720797`*^9}, {3.743102549205044*^9, 
   3.743102667159464*^9}, {3.743102835150427*^9, 3.743102928869755*^9}, {
   3.7431031933661833`*^9, 3.743103199285664*^9}, {3.743103636264673*^9, 
   3.743103646074959*^9}, 3.743103731527668*^9, {3.743104217917305*^9, 
   3.743104267796666*^9}, 3.743104333891958*^9, {3.7431044377528753`*^9, 
   3.743104537036784*^9}, {3.743104572864994*^9, 3.743104577659133*^9}, {
   3.743104611924368*^9, 3.7431046291500893`*^9}, 3.743105109880602*^9, 
   3.743105157336005*^9, {3.743105211055396*^9, 3.743105240121357*^9}, {
   3.743105327357657*^9, 3.743105333250992*^9}, {3.743105392843712*^9, 
   3.743105434672679*^9}, {3.743105467669574*^9, 3.7431055769287024`*^9}, {
   3.74310566449142*^9, 3.743105669843544*^9}, {3.7431060679193697`*^9, 
   3.743106092014777*^9}, {3.743106143282691*^9, 3.7431061577143583`*^9}, {
   3.7431063529975557`*^9, 3.743106366641781*^9}, {3.7431117806061277`*^9, 
   3.74311180983357*^9}, {3.743111846554482*^9, 3.743111877268161*^9}, {
   3.7431123332468157`*^9, 3.743112351566482*^9}, {3.7431124431245213`*^9, 
   3.743112450233963*^9}, {3.743112496946677*^9, 3.743112501974283*^9}, {
   3.743112658745331*^9, 3.7431126735271797`*^9}, {3.743131635471176*^9, 
   3.743131642661757*^9}, {3.743131811754251*^9, 3.7431318238126698`*^9}, {
   3.743132828200376*^9, 3.743132837020081*^9}, {3.743132873925336*^9, 
   3.74313287960718*^9}, 3.7431801067220697`*^9, {3.743180221863619*^9, 
   3.743180330168782*^9}, {3.7431804102020483`*^9, 3.74318062668928*^9}, {
   3.743180871245894*^9, 3.74318089070934*^9}, {3.743181692705187*^9, 
   3.7431817844906816`*^9}, {3.744654143459651*^9, 3.744654148560255*^9}, 
   3.744654183787085*^9, {3.7446542556094627`*^9, 3.744654283262102*^9}, {
   3.7447328409348173`*^9, 3.7447328419846992`*^9}, {3.744732916641226*^9, 
   3.744732917619041*^9}, {3.7447330757961493`*^9, 3.74473311622787*^9}, {
   3.744751262720357*^9, 3.744751273535924*^9}, {3.7447514280712833`*^9, 
   3.744751435280991*^9}, {3.744751923469644*^9, 3.7447519500164337`*^9}, {
   3.744752281029438*^9, 3.744752281374856*^9}, {3.744752384419065*^9, 
   3.744752391132025*^9}, {3.744752424388055*^9, 3.7447524544590282`*^9}, {
   3.7447525951044273`*^9, 3.74475259532858*^9}, {3.744752677510619*^9, 
   3.744752677665288*^9}, {3.74475275370011*^9, 3.7447527710586367`*^9}, {
   3.7447529520624437`*^9, 3.744752953342915*^9}, {3.7447530691864977`*^9, 
   3.744753070129579*^9}, {3.744827429918364*^9, 3.7448274360800867`*^9}, {
   3.7448276968987093`*^9, 3.744827723941949*^9}, {3.744828095519689*^9, 
   3.744828184741804*^9}, {3.7448282227258883`*^9, 3.744828237698402*^9}, {
   3.7448282820268517`*^9, 3.74482828310452*^9}, {3.744828378666296*^9, 
   3.7448283921309643`*^9}, 3.74482845480556*^9, {3.744828496398592*^9, 
   3.744828537315411*^9}, {3.7448295536134644`*^9, 3.744829567316066*^9}, {
   3.744842743299222*^9, 3.744842746263483*^9}, {3.744842865792077*^9, 
   3.744842919161889*^9}, {3.744843035264269*^9, 3.7448430394430447`*^9}, {
   3.7448432389181557`*^9, 3.7448433594307957`*^9}, {3.744843428114716*^9, 
   3.744843428476159*^9}, {3.7448436250977592`*^9, 3.7448436350502853`*^9}, {
   3.744843695860916*^9, 3.744843719653783*^9}, {3.744844354478013*^9, 
   3.744844407400724*^9}, {3.744844727311925*^9, 3.744844763846841*^9}, {
   3.744844848231379*^9, 3.744844864029204*^9}, {3.744844899880197*^9, 
   3.744844982819318*^9}, {3.744845328549646*^9, 3.744845345381413*^9}, {
   3.74484552475445*^9, 3.744845545770934*^9}, {3.744845707987576*^9, 
   3.7448457117205677`*^9}, {3.744845949893395*^9, 3.7448459580819893`*^9}, {
   3.744846032503386*^9, 3.744846060290679*^9}, {3.744846090825747*^9, 
   3.744846166127261*^9}, {3.744996196120421*^9, 3.7449962158063383`*^9}, {
   3.7449963754174137`*^9, 3.744996383199461*^9}, {3.744996428034944*^9, 
   3.744996441920109*^9}, {3.7449965915678797`*^9, 3.744996736923441*^9}, {
   3.744996848568516*^9, 3.744996891950739*^9}, {3.744997703186665*^9, 
   3.7449977507063704`*^9}, {3.744999367491241*^9, 3.744999385692173*^9}, {
   3.745000547331398*^9, 3.7450005644653788`*^9}, {3.745000622374316*^9, 
   3.745000628919981*^9}, {3.745001708416799*^9, 3.745001709066225*^9}, {
   3.745015522854413*^9, 3.745015531952531*^9}, {3.745016514247143*^9, 
   3.745016521163856*^9}, {3.7450784750311604`*^9, 3.74507848320851*^9}, 
   3.7450785252519407`*^9, 3.7450785752503033`*^9, {3.7450795497931957`*^9, 
   3.7450797147330523`*^9}, {3.745079965234202*^9, 3.745079965975891*^9}, {
   3.7450800245828342`*^9, 3.745080069759873*^9}, {3.745080219301351*^9, 
   3.745080223225419*^9}, {3.74508027762162*^9, 3.7450804387923527`*^9}, {
   3.7450806388818283`*^9, 3.7450806772890167`*^9}, 3.7453466493981047`*^9, {
   3.7453467612672443`*^9, 3.745346795027234*^9}, 3.745346992663679*^9, 
   3.745347068724222*^9, 3.745357577559857*^9, {3.745444928958908*^9, 
   3.745444949933777*^9}, {3.7454451348204393`*^9, 3.745445155566903*^9}, {
   3.745445186594891*^9, 3.745445188980047*^9}, {3.74544530662613*^9, 
   3.7454453142175627`*^9}, {3.745445344548032*^9, 3.745445357091887*^9}, {
   3.7454454260905123`*^9, 3.745445428373391*^9}, 3.745445603292941*^9, {
   3.745445663953843*^9, 3.745445695601647*^9}, {3.7454457434149303`*^9, 
   3.7454457917005577`*^9}, {3.745445876493628*^9, 3.745445965978486*^9}, {
   3.745446237760502*^9, 3.745446263814311*^9}, {3.745446325907465*^9, 
   3.745446383078558*^9}, {3.745446574616609*^9, 3.745446598318825*^9}, {
   3.745446630383648*^9, 3.745446645222728*^9}, {3.745446695825659*^9, 
   3.745446703002742*^9}, {3.745446735562284*^9, 3.74544678968587*^9}, {
   3.745446825585737*^9, 3.745446839344447*^9}, {3.745447088842423*^9, 
   3.745447089415094*^9}, {3.745447131761015*^9, 3.745447161686614*^9}, {
   3.745447291765407*^9, 3.745447307704462*^9}, {3.7454474188260527`*^9, 
   3.7454474223235693`*^9}, 3.745447622149911*^9, {3.7454477291053667`*^9, 
   3.745447729780533*^9}, {3.745447813494163*^9, 3.7454478207683992`*^9}, {
   3.745448291996155*^9, 3.745448312784885*^9}, {3.745448396635704*^9, 
   3.745448404235157*^9}, {3.745448454773435*^9, 3.7454484656505747`*^9}, 
   3.7454485809786863`*^9, {3.745448879897603*^9, 3.745448926449547*^9}, 
   3.745448995876828*^9, {3.745449195433079*^9, 3.745449210024702*^9}, {
   3.745449252617283*^9, 3.745449259806994*^9}, {3.74544929352549*^9, 
   3.7454493095782967`*^9}, {3.745449635227954*^9, 3.7454496884300957`*^9}, {
   3.7455143326465397`*^9, 3.745514348757744*^9}, {3.7455144766067667`*^9, 
   3.745514477358975*^9}, 3.745514518806559*^9, {3.745514746038941*^9, 
   3.745514808311743*^9}, {3.745515250051415*^9, 3.745515288717122*^9}, {
   3.745515373444674*^9, 3.7455154184886637`*^9}, {3.745515761712287*^9, 
   3.745515832519508*^9}, {3.745515863695063*^9, 3.7455159334908743`*^9}, {
   3.745516120304181*^9, 3.745516127175324*^9}, {3.745516203037497*^9, 
   3.745516296974594*^9}, {3.745516492934455*^9, 3.745516538888568*^9}, {
   3.745516733159333*^9, 3.745516747827804*^9}, {3.745516908111314*^9, 
   3.7455169368209467`*^9}, {3.745517042395689*^9, 3.745517106914721*^9}, {
   3.745517195073464*^9, 3.745517382219242*^9}, {3.745517580820771*^9, 
   3.7455176047378607`*^9}, 3.7455176829956903`*^9, {3.745517792527751*^9, 
   3.745517801953846*^9}, {3.745519731090693*^9, 3.7455198072959433`*^9}, {
   3.745519842576742*^9, 3.745519848112043*^9}, {3.7455199533803663`*^9, 
   3.745520014064045*^9}, {3.745520099814733*^9, 3.745520183712886*^9}, {
   3.745520651347927*^9, 3.745520667916774*^9}, {3.745520720658749*^9, 
   3.745520735091091*^9}, {3.745521002105661*^9, 3.745521069099313*^9}, {
   3.74552114135039*^9, 3.7455211417869377`*^9}, {3.7455223653888273`*^9, 
   3.74552239315256*^9}, {3.745522918231772*^9, 3.74552293386757*^9}, {
   3.745602292202291*^9, 3.74560238135569*^9}, {3.74560241168783*^9, 
   3.7456024361556587`*^9}, {3.745602526587627*^9, 3.745602534910302*^9}, 
   3.745602588126741*^9, {3.745603362240271*^9, 3.745603363070195*^9}, {
   3.745603769846314*^9, 3.7456037800597677`*^9}, {3.7456041270399237`*^9, 
   3.7456041274428387`*^9}, {3.7456043884952908`*^9, 3.745604419971095*^9}, {
   3.7456044818035507`*^9, 3.745604482195402*^9}, {3.7456045132265377`*^9, 
   3.745604513831921*^9}, {3.7456049278306923`*^9, 3.745604930280641*^9}, {
   3.745605022005444*^9, 3.745605089584961*^9}, {3.745605157109929*^9, 
   3.745605162789714*^9}, {3.745687320021184*^9, 3.745687380544511*^9}, {
   3.7456874143872337`*^9, 3.745687438640959*^9}, {3.745687469656837*^9, 
   3.745687659807354*^9}, {3.745688080554901*^9, 3.7456881001973457`*^9}, {
   3.7462905998051863`*^9, 3.746290603076961*^9}},
 CellLabel->"In[7]:=",ExpressionUUID->"dc86d10c-ca2b-4121-ad80-5fa029a3fad9"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"\[IndentingNewLine]", 
  RowBox[{"Manipulate", "[", 
   RowBox[{
    RowBox[{"HolobiontDynamicsHorizontal", "[", 
     RowBox[{
     "tM", ",", "tm", ",", "r", ",", " ", "K", ",", " ", "W0", ",", "WK", ",",
       "Init", ",", "DisplayOption"}], "]"}], ",", " ", "\[IndentingNewLine]", 
    RowBox[{"(*", " ", 
     RowBox[{"Note", ",", " ", 
      RowBox[{
      "parameters", " ", "calling", " ", "the", " ", "Manipulate", " ", 
       "function", " ", "are", " ", "global"}]}], " ", "*)"}], 
    "\[IndentingNewLine]", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"tM", ",", "11", ",", "\"\<tM, Macro Time Steps\>\""}], "}"}], 
      ",", "0", ",", "50", ",", "1", ",", 
      RowBox[{"Appearance", "\[Rule]", " ", "\"\<Labeled\>\""}]}], "}"}], ",",
     "\[IndentingNewLine]", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"tm", ",", "3", ",", "\"\<tm, Micro Time Steps\>\""}], "}"}], 
      ",", "0", ",", "15", ",", "1", ",", 
      RowBox[{"Appearance", "\[Rule]", " ", "\"\<Labeled\>\""}]}], "}"}], ",",
     "\[IndentingNewLine]", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"r", ",", "0.025", ",", "\"\<r, Microbial Logistic r\>\""}], 
       "}"}], ",", "0", ",", "1", ",", " ", 
      RowBox[{"Appearance", "\[Rule]", " ", "\"\<Labeled\>\""}]}], "}"}], ",",
     "\[IndentingNewLine]", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"K", ",", "20", ",", "\"\<K, Microbial Logistic K\>\""}], 
       "}"}], ",", "1", ",", "40", ",", "1", ",", " ", 
      RowBox[{"Appearance", "\[Rule]", " ", "\"\<Labeled\>\""}]}], "}"}], ",",
     "\[IndentingNewLine]", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
       "W0", ",", "2", ",", "\"\<W0, Holobiont Fitness, 0 Microbes\>\""}], 
       "}"}], ",", "0", ",", "2", ",", " ", 
      RowBox[{"Appearance", "\[Rule]", " ", "\"\<Labeled\>\""}]}], "}"}], ",",
     "\[IndentingNewLine]", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
       "WK", ",", "0", ",", "\"\<WK, Holobiont Fitness, K Microbes\>\""}], 
       "}"}], ",", "0", ",", "2", ",", " ", 
      RowBox[{"Appearance", "\[Rule]", " ", "\"\<Labeled\>\""}]}], "}"}], ",",
     "\[IndentingNewLine]", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
       "Init", ",", "2", ",", 
        "\"\<Initial: Decreasing, Flat, or Increasing\>\""}], "}"}], ",", "1",
       ",", "3", ",", "1", ",", " ", 
      RowBox[{"Appearance", "\[Rule]", " ", "\"\<Labeled\>\""}]}], "}"}], ",",
     "\[IndentingNewLine]", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
       "DisplayOption", ",", "2", ",", 
        "\"\<Display Option: Table, Chart, Picture\>\""}], "}"}], ",", "1", 
      ",", "3", ",", "1", ",", " ", 
      RowBox[{"Appearance", "\[Rule]", " ", "\"\<Labeled\>\""}]}], "}"}], ",",
     "\[IndentingNewLine]", 
    RowBox[{"SaveDefinitions", "\[Rule]", "True"}], ",", 
    RowBox[{"FrameLabel", "\[Rule]", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"\"\<\>\"", ",", "\"\<\>\""}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"\"\<\>\"", ",", 
         RowBox[{"Style", "[", 
          RowBox[{
          "\"\<Horizontal Colonization, One Host Niche, One Microbial Taxon\>\
\"", ",", "14", ",", "Bold"}], "]"}]}], "}"}]}], "}"}]}]}], "]"}]}]], "Input",\

 CellOpen->False,
 CellChangeTimes->{{3.745447880666585*^9, 3.7454479132821493`*^9}, {
  3.7454479453139353`*^9, 3.745448083318891*^9}, {3.745448151316019*^9, 
  3.745448161293991*^9}, {3.745448205520833*^9, 3.745448229224143*^9}, {
  3.745448631962142*^9, 3.745448657800789*^9}, {3.745514371994965*^9, 
  3.7455144148136806`*^9}, {3.745687699517293*^9, 3.745687727662315*^9}, {
  3.745687938852509*^9, 3.7456879436431627`*^9}, {3.746290125609578*^9, 
  3.7462902618134623`*^9}, {3.746290353393235*^9, 3.746290353784507*^9}, {
  3.7462904846726713`*^9, 3.7462905010170507`*^9}, {3.746290822518757*^9, 
  3.7462908229439993`*^9}},
 CellLabel->"In[8]:=",ExpressionUUID->"72643ee9-6abd-47ab-8c1c-a419c6ff0390"],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`DisplayOption$$ = 2, $CellContext`Init$$ = 
    2, K$$ = 20, $CellContext`r$$ = 0.025, $CellContext`tm$$ = 
    3, $CellContext`tM$$ = 11, $CellContext`W0$$ = 2, $CellContext`WK$$ = 0, 
    Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
    Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ = 
    1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`tM$$], 11, "tM, Macro Time Steps"}, 0, 50, 1}, {{
       Hold[$CellContext`tm$$], 3, "tm, Micro Time Steps"}, 0, 15, 1}, {{
       Hold[$CellContext`r$$], 0.025, "r, Microbial Logistic r"}, 0, 1}, {{
       Hold[K$$], 20, "K, Microbial Logistic K"}, 1, 40, 1}, {{
       Hold[$CellContext`W0$$], 2, "W0, Holobiont Fitness, 0 Microbes"}, 0, 
      2}, {{
       Hold[$CellContext`WK$$], 0, "WK, Holobiont Fitness, K Microbes"}, 0, 
      2}, {{
       Hold[$CellContext`Init$$], 2, 
       "Initial: Decreasing, Flat, or Increasing"}, 1, 3, 1}, {{
       Hold[$CellContext`DisplayOption$$], 2, 
       "Display Option: Table, Chart, Picture"}, 1, 3, 1}}, Typeset`size$$ = {
    593., {305., 310.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
    Typeset`skipInitDone$$ = False, $CellContext`tM$8940$$ = 
    0, $CellContext`tm$8941$$ = 0, $CellContext`r$8942$$ = 0, K$8943$$ = 
    0, $CellContext`W0$8944$$ = 0, $CellContext`WK$8945$$ = 
    0, $CellContext`Init$8946$$ = 0, $CellContext`DisplayOption$8947$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`DisplayOption$$ = 2, $CellContext`Init$$ = 
        2, K$$ = 20, $CellContext`r$$ = 0.025, $CellContext`tm$$ = 
        3, $CellContext`tM$$ = 11, $CellContext`W0$$ = 2, $CellContext`WK$$ = 
        0}, "ControllerVariables" :> {
        Hold[$CellContext`tM$$, $CellContext`tM$8940$$, 0], 
        Hold[$CellContext`tm$$, $CellContext`tm$8941$$, 0], 
        Hold[$CellContext`r$$, $CellContext`r$8942$$, 0], 
        Hold[K$$, K$8943$$, 0], 
        Hold[$CellContext`W0$$, $CellContext`W0$8944$$, 0], 
        Hold[$CellContext`WK$$, $CellContext`WK$8945$$, 0], 
        Hold[$CellContext`Init$$, $CellContext`Init$8946$$, 0], 
        Hold[$CellContext`DisplayOption$$, $CellContext`DisplayOption$8947$$, 
         0]}, "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, 
      "Body" :> $CellContext`HolobiontDynamicsHorizontal[$CellContext`tM$$, \
$CellContext`tm$$, $CellContext`r$$, 
        K$$, $CellContext`W0$$, $CellContext`WK$$, $CellContext`Init$$, \
$CellContext`DisplayOption$$], 
      "Specifications" :> {{{$CellContext`tM$$, 11, "tM, Macro Time Steps"}, 
         0, 50, 1, Appearance -> 
         "Labeled"}, {{$CellContext`tm$$, 3, "tm, Micro Time Steps"}, 0, 15, 
         1, Appearance -> 
         "Labeled"}, {{$CellContext`r$$, 0.025, "r, Microbial Logistic r"}, 0,
          1, Appearance -> "Labeled"}, {{K$$, 20, "K, Microbial Logistic K"}, 
         1, 40, 1, Appearance -> 
         "Labeled"}, {{$CellContext`W0$$, 2, 
          "W0, Holobiont Fitness, 0 Microbes"}, 0, 2, Appearance -> 
         "Labeled"}, {{$CellContext`WK$$, 0, 
          "WK, Holobiont Fitness, K Microbes"}, 0, 2, Appearance -> 
         "Labeled"}, {{$CellContext`Init$$, 2, 
          "Initial: Decreasing, Flat, or Increasing"}, 1, 3, 1, Appearance -> 
         "Labeled"}, {{$CellContext`DisplayOption$$, 2, 
          "Display Option: Table, Chart, Picture"}, 1, 3, 1, Appearance -> 
         "Labeled"}}, "Options" :> {FrameLabel -> {{"", ""}, {"", 
           Style[
           "Horizontal Colonization, One Host Niche, One Microbial Taxon", 14,
             Bold]}}}, "DefaultOptions" :> {}],
     ImageSizeCache->{1074., {353., 359.}},
     SingleEvaluation->True],
    Deinitialization:>None,
    DynamicModuleValues:>{},
    Initialization:>({$CellContext`HolobiontDynamicsHorizontal[
         Pattern[$CellContext`tM, 
          Blank[]], 
         Pattern[$CellContext`tm, 
          Blank[]], 
         Pattern[$CellContext`r, 
          Blank[]], 
         Pattern[K, 
          Blank[]], 
         Pattern[$CellContext`W0, 
          Blank[]], 
         Pattern[$CellContext`WK, 
          Blank[]], 
         Pattern[$CellContext`Init, 
          Blank[]], 
         Pattern[$CellContext`DisplayOption, 
          Blank[]]] := 
       Module[{$CellContext`F, $CellContext`Fiterate, \
$CellContext`nprimeprime, $CellContext`MU, $CellContext`MUinit, \
$CellContext`nprime, $CellContext`Hprime, $CellContext`Hprimeprime, \
$CellContext`W, $CellContext`ShortFall, $CellContext`HolobiontFitnessPlot, \
$CellContext`HolobiontNumberPlot, $CellContext`SymbiontNumberPlot, \
$CellContext`ChartColor, $CellContext`HostPopulationColor, \
$CellContext`GuestPopulationColor, $CellContext`HCharts, \
$CellContext`HGraphsGrid, $CellContext`PictureGridList}, 
         If[$CellContext`Init == 1, $CellContext`Hinit = 
           Table[K + 1 - $CellContext`n, {$CellContext`n, 0, K}], 
           
           If[$CellContext`Init == 2, $CellContext`Hinit = 
            Table[10, {$CellContext`n, 0, K}], 
            
            If[$CellContext`Init == 3, $CellContext`Hinit = 
             Table[$CellContext`n, {$CellContext`n, 0, K}], $CellContext`H = 
             Table[0, {$CellContext`n, 0, K}]]]]; $CellContext`HTinit = 
          Total[$CellContext`Hinit]; $CellContext`GTinit = 
          Sum[$CellContext`n 
            Part[$CellContext`Hinit, $CellContext`n + 1], {$CellContext`n, 0, 
             K}]; $CellContext`MUinit = \
$CellContext`GTinit/$CellContext`HTinit; $CellContext`HT = \
{$CellContext`HTinit}; $CellContext`GT = {$CellContext`GTinit}; \
$CellContext`H = {
            Round[N[Table[
                 PDF[
                  
                  PoissonDistribution[$CellContext`MUinit], $CellContext`n], \
{$CellContext`n, 0, K}]/N[
                CDF[
                 PoissonDistribution[$CellContext`MUinit], 
                 K]]] $CellContext`HTinit]}; $CellContext`F[
            Pattern[$CellContext`n, 
             Blank[]]] := (
            1 + $CellContext`r - $CellContext`r ($CellContext`n/
             K)) $CellContext`n; $CellContext`Fiterate[
            Pattern[$CellContext`n, 
             Blank[]]] := Simplify[
            
            Nest[$CellContext`F, $CellContext`n, $CellContext`tm]]; \
$CellContext`nprimeprime = Table[
            Round[
             $CellContext`Fiterate[$CellContext`n]], {$CellContext`n, 0, K}]; 
         If[K > 0, $CellContext`W = 
           Table[$CellContext`W0 + (($CellContext`WK - $CellContext`W0)/
               K) $CellContext`n, {$CellContext`n, 0, K}], $CellContext`W = 
           Table[0, {$CellContext`n, 0, K}]]; For[$CellContext`t = 1, 
           
           And[$CellContext`t <= $CellContext`tM, 
            Part[$CellContext`HT, $CellContext`t] > 0, 
            Part[$CellContext`GT, $CellContext`t] > 0], 
           
           PreIncrement[$CellContext`t], $CellContext`MU = 
            Part[$CellContext`GT, $CellContext`t]/
             Part[$CellContext`HT, $CellContext`t]; $CellContext`Hprime = 
            Round[N[Table[
                  PDF[
                   
                   PoissonDistribution[$CellContext`MU], $CellContext`n], \
{$CellContext`n, 0, K}]/N[
                 CDF[
                  PoissonDistribution[$CellContext`MU], K]]] 
              Part[$CellContext`HT, $CellContext`t]]; \
$CellContext`Hprimeprime = Table[
              Total[
               Part[$CellContext`Hprime, 
                Flatten[
                 
                 Position[$CellContext`nprimeprime, $CellContext`n]]]], \
{$CellContext`n, 0, K}]; $CellContext`H = Append[$CellContext`H, 
              
              Round[$CellContext`W $CellContext`Hprimeprime]]; \
$CellContext`HT = Append[$CellContext`HT, 
              Total[
               Part[$CellContext`H, $CellContext`t + 1]]]; $CellContext`GT = 
            Append[$CellContext`GT, 
              
              Sum[$CellContext`n 
               Part[$CellContext`H, $CellContext`t + 1, $CellContext`n + 
                 1], {$CellContext`n, 0, K}]]; Null]; $CellContext`H = 
          Append[$CellContext`H, {$CellContext`tM, $CellContext`tm, \
$CellContext`r, K, $CellContext`W0, $CellContext`WK}]; 
         If[$CellContext`DisplayOption == 1, 
           TableForm[$CellContext`H], 
           If[$CellContext`WK > $CellContext`W0, $CellContext`ChartColor = 
             RGBColor[0, 1, 0, 1], 
             
             If[$CellContext`WK < $CellContext`W0, $CellContext`ChartColor = 
              RGBColor[0.6, 0.4, 0.2, 1], 
              
              If[$CellContext`WK == $CellContext`W0, $CellContext`ChartColor = 
               RGBColor[0, 0, 0, 1]]]]; 
           If[Length[$CellContext`H] < $CellContext`tM + 
              1, $CellContext`TimeToExtinction = 
             Length[$CellContext`H] - 1, $CellContext`TimeToExtinction = 0; 
             For[$CellContext`t = 0, $CellContext`t <= $CellContext`tM, 
               PreIncrement[$CellContext`t], 
               If[Part[$CellContext`HT, $CellContext`t + 1] > 0, 
                PreIncrement[$CellContext`TimeToExtinction]]]]; 
           If[Part[$CellContext`HT, $CellContext`TimeToExtinction] == 0, 
             PreDecrement[$CellContext`TimeToExtinction]]; 
           If[Part[$CellContext`HT, 1] > 
             Part[$CellContext`HT, $CellContext`TimeToExtinction], \
$CellContext`HostPopulationColor = RGBColor[1, 0, 0, 1], 
             If[
             Part[$CellContext`HT, 1] < 
              Part[$CellContext`HT, $CellContext`TimeToExtinction], \
$CellContext`HostPopulationColor = RGBColor[0, 0, 1, 1], 
              If[
              Part[$CellContext`HT, 1] == 
               Part[$CellContext`HT, $CellContext`TimeToExtinction], \
$CellContext`HostPopulationColor = RGBColor[0, 0, 0, 1]]]]; 
           If[Part[$CellContext`GT, 1] > 
             Part[$CellContext`GT, $CellContext`TimeToExtinction], \
$CellContext`GuestPopulationColor = RGBColor[1, 0, 0, 1], 
             If[
             Part[$CellContext`GT, 1] < 
              Part[$CellContext`GT, $CellContext`TimeToExtinction], \
$CellContext`GuestPopulationColor = RGBColor[0, 0, 1, 1], 
              If[
              Part[$CellContext`GT, 1] == 
               Part[$CellContext`GT, $CellContext`TimeToExtinction], \
$CellContext`GuestPopulationColor = 
               RGBColor[0, 0, 0, 0]]]]; $CellContext`HolobiontFitnessPlot = 
            ListLinePlot[
              Table[{$CellContext`n, 
                Part[$CellContext`W, $CellContext`n + 1]}, {$CellContext`n, 0,
                 K}], Frame -> True, PlotLabel -> "Holobiont Fitness", 
              FrameLabel -> {"Symbont Number, n", "W(n)"}, 
              PlotStyle -> $CellContext`ChartColor]; \
$CellContext`HolobiontNumberPlot = ListLinePlot[
              Table[{$CellContext`t - 1, 
                Log10[
                 Part[$CellContext`HT, $CellContext`t]]}, {$CellContext`t, 
                1, $CellContext`TimeToExtinction}], 
              PlotRange -> {{0, $CellContext`TimeToExtinction - 1}, All}, 
              Frame -> True, PlotLabel -> "Holobiont Number", 
              FrameLabel -> {"Time", "Log10[HT(t)]"}, 
              PlotStyle -> $CellContext`HostPopulationColor]; \
$CellContext`SymbiontNumberPlot = ListLinePlot[
              Table[{$CellContext`t - 1, 
                Log10[
                 Part[$CellContext`GT, $CellContext`t]]}, {$CellContext`t, 
                1, $CellContext`TimeToExtinction}], 
              PlotRange -> {{0, $CellContext`TimeToExtinction - 1}, All}, 
              Frame -> True, PlotLabel -> "Microbe Number", 
              FrameLabel -> {"Time", "Log10[GT(t)]"}, 
              PlotStyle -> $CellContext`GuestPopulationColor]; 
           If[$CellContext`DisplayOption == 2, $CellContext`HCharts = Table[
                BarChart[
                Part[$CellContext`H, $CellContext`t]/
                 Part[$CellContext`HT, $CellContext`t], ImageSize -> Small, 
                 PlotLabel -> StringForm["t = ``", $CellContext`t - 1], 
                 ChartStyle -> $CellContext`ChartColor], {$CellContext`t, 
                 1, $CellContext`TimeToExtinction}]; $CellContext`HGraphsGrid = 
              GraphicsGrid[
                Prepend[
                 Table[
                  Table[
                   
                   Part[$CellContext`HCharts, $CellContext`t + 
                    3 ($CellContext`row - 1)], {$CellContext`t, 1, 
                    3}], {$CellContext`row, 1, 
                   
                   Floor[$CellContext`TimeToExtinction/
                    3]}], {$CellContext`HolobiontNumberPlot, \
$CellContext`SymbiontNumberPlot, $CellContext`HolobiontFitnessPlot}], Frame -> 
                True], 
             
             If[$CellContext`DisplayOption == 3, 
              If[$CellContext`WK > $CellContext`W0, \
$CellContext`PictureGridList = Table[
                  Graphics[{
                    EdgeForm[Thick], 
                    RGBColor[0, 1, 0, Sum[$CellContext`n (Part[
                    Part[$CellContext`H, $CellContext`t], $CellContext`n]/
                    Part[$CellContext`HT, $CellContext`t]), {$CellContext`n, 
                    0, K}]/K], 
                    Rectangle[{0, 0}, {1, 1}, RoundingRadius -> 1/4]}, 
                   PlotLabel -> 
                   StringForm["t = ``", $CellContext`t - 1]], {$CellContext`t,
                    1, $CellContext`TimeToExtinction}], 
                
                If[$CellContext`WK < $CellContext`W0, \
$CellContext`PictureGridList = Table[
                   Graphics[{
                    EdgeForm[Thick], 
                    RGBColor[0.6, 0.4, 0.2, Sum[$CellContext`n (Part[
                    Part[$CellContext`H, $CellContext`t], $CellContext`n]/
                    Part[$CellContext`HT, $CellContext`t]), {$CellContext`n, 
                    0, K}]/K], 
                    Rectangle[{0, 0}, {1, 1}, RoundingRadius -> 1/4]}, 
                    PlotLabel -> 
                    StringForm[
                    "t = ``", $CellContext`t - 1]], {$CellContext`t, 
                    1, $CellContext`TimeToExtinction}], 
                 
                 If[$CellContext`WK == $CellContext`W0, \
$CellContext`PictureGridList = Table[
                    Graphics[{
                    EdgeForm[Thick], 
                    RGBColor[0, 0, 0, Sum[$CellContext`n (Part[
                    Part[$CellContext`H, $CellContext`t], $CellContext`n]/
                    Part[$CellContext`HT, $CellContext`t]), {$CellContext`n, 
                    0, K}]/K], 
                    Rectangle[{0, 0}, {1, 1}, RoundingRadius -> 1/4]}, 
                    PlotLabel -> 
                    StringForm[
                    "t = ``", $CellContext`t - 1]], {$CellContext`t, 
                    1, $CellContext`TimeToExtinction}]]]]; GraphicsGrid[
                Prepend[
                 Table[
                  Table[
                   
                   Part[$CellContext`PictureGridList, $CellContext`t + 
                    3 ($CellContext`row - 1)], {$CellContext`t, 1, 
                    3}], {$CellContext`row, 1, 
                   
                   Floor[$CellContext`TimeToExtinction/
                    3]}], {$CellContext`HolobiontNumberPlot, \
$CellContext`SymbiontNumberPlot, $CellContext`HolobiontFitnessPlot}], Frame -> 
                True]]]]]}; Typeset`initDone$$ = True),
    SynchronousInitialization->True,
    UndoTrackedVariables:>{Typeset`show$$, Typeset`bookmarkMode$$},
    UnsavedVariables:>{Typeset`initDone$$},
    UntrackedVariables:>{Typeset`size$$}], "Manipulate",
   Deployed->True,
   StripOnInput->False],
  Manipulate`InterpretManipulate[1]]], "Output",
 CellChangeTimes->{
  3.745688137663578*^9, 3.745688360391148*^9, 3.746290065124735*^9, 
   3.746290182504105*^9, 3.7462902705962877`*^9, 3.7462903562065897`*^9, 
   3.7462904512205353`*^9, {3.7462904888724937`*^9, 3.746290503123515*^9}, 
   3.7462908281802883`*^9, 3.746546284804221*^9},
 CellLabel->"Out[8]=",ExpressionUUID->"dc9ac954-18ae-48ba-918b-b343f46b7b37"]
}, Open  ]]
},
WindowSize->{1767, 1289},
WindowMargins->{{385, Automatic}, {Automatic, 0}},
FrontEndVersion->"11.3 for Mac OS X x86 (32-bit, 64-bit Kernel) (March 5, \
2018)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[1488, 33, 1163, 23, 73, "Input",ExpressionUUID->"14bf564c-a17f-4de0-8377-0ca28270b31e"],
Cell[2654, 58, 172, 3, 19, "Input",ExpressionUUID->"9e7a2b49-8641-463d-94e7-51e2f062a5cb",
 CellOpen->False],
Cell[2829, 63, 42194, 866, 19, "Input",ExpressionUUID->"dc86d10c-ca2b-4121-ad80-5fa029a3fad9",
 CellOpen->False],
Cell[CellGroupData[{
Cell[45048, 933, 4114, 99, 19, "Input",ExpressionUUID->"72643ee9-6abd-47ab-8c1c-a419c6ff0390",
 CellOpen->False],
Cell[49165, 1034, 16375, 323, 731, "Output",ExpressionUUID->"dc9ac954-18ae-48ba-918b-b343f46b7b37"]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature @w01KrF6k9YSmDw2XGc#NFCU *)
