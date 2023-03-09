% ------------------------------------------------------------------------
% Pareto quality indices developed by 
% Bahman Ahmadi , University of Twente, b.ahmadi@utwente.nl
% ------------------------------------------------------------------------

clc,close all,clear all

%% load set of Pareto(s)
%Pareto_set1=Generate_Pareto_example(100);
%hold on
%Pareto_set2=Generate_Pareto_example(100);

Pareto_set1=[1,5;2,4;3,3;4,2];
Pareto_set2=[1.1,9;2,4;3,3;4,2];


%% C index
C_index_set1_set2=C_ind(Pareto_set1,Pareto_set2)

C_index_set2_set1=C_ind(Pareto_set2,Pareto_set1)

%% Spacing
S=metric_of_spacing(Pareto_set1)

S=metric_of_spacing(Pareto_set2)

%% Hypervolume
%if want to calculate it just for Pareto_set1
R=max(Pareto_set1)
HV = hypervolume(Pareto_set1,R)

%if Pareto optimal solution for the problem is known>> then R=max(optPareto)
%if you have more than one set of Pareto solution and Pareto optimal solutions for the problem is unknown:
%then R=max([Pareto_set1;Pareto_set2;...;Pareto_setn])

%if want to compare several sets: 
R=max([Pareto_set1;Pareto_set2]);
HV1 = hypervolume(Pareto_set1,R)
HV2 = hypervolume(Pareto_set2,R)

