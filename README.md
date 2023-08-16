# 'Navigating the New Normal: Examining Co-Attendance in a Hybrid Work Environment' Research Code Repository

This repo include Python/R scripts to produce analysis results and visualizations for the hybrid co-attendance research. 

If you have any questions regarding the scripts, please email me at dehzhang@microsoft.com. 

In the Scripts folder, there are three scripts:
  * [Modeling_Analysis.ipynb]. This script contains Python & R code for data processing using Spark SQL and Pandas Library, as well as Two-Way fixed effect (TWFE) Modeling using bife libary in R. This script was run through Azure Synapse notebook, which supports both Python and R languages.
  * [US_Time_Series_Viz.rmd]. This script contains R code for plotting four series of conditional attendance probability at the US headquarter, smoothed
using a 5-day rolling window (Figure 1a in the paper).
  * [Paremetric_Estimation_Relative_Effects_Viz.ipynb](https://github.com/dehaoterryzhang/Co-Attendance-Hybrid/blob/main/Scripts/Parametric_Estimation_Relative_Effects_Viz.ipynb). This script contains Python code for plotting parametric estimations for co-attendance patterns across US Headquarters, India, and Ireland (Figure 1b), and TWFE relative effects comparsion by job role, new-hire status, and workspace type (Figure 2).
