%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Author: Francesco Furno
Created: 10 March 2020
Last Revision: 08 March 2021
Known Compatible MATLAB: Version R2020b
Known Compatible Dynare: Version 4.6.3 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

This toolbox manipulates outputs from Dynare. The functions are related to each other.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
List of functions in the Toolbox:
- clean_dynare_output
- clean_dynare_steady
- var_list_extractor
- SS_extractor
- IRF_extractor
- SS_percentage_change
- SS_GDP_Shares
- Transition_extractor 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Function Descriptions:
- clean_dynare_output: cleans output generated by Dynare
- clean_dynare_steady: cleans output generated by Dynare's steady command
- var_list_extractor: extracts names of variables from dynare M_
- SS_extractor: extracts SS with names in a structure from dynare M_ and oo_
- IRF_extractor: extracts IRFs with names in a structure from dynare M_ and oo_ (both levels and deviations)
- SS_percentage_change: computes percentage change comparing two SS recovered with SS_extractor
- SS_GDP_Shares: takes SS values from "SS_extractor" and scales them by a variable of choice
- Transition_extractor: computes transition after an MIT shock (both levels and % deviations from initial SS)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Notes:
- Always write the model in levels, and then compute deviations afterwards
- For transitions, code the shocks as varexo and assign value through parameter


