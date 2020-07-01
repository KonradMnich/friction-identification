clear

%//////User input///////////////%    
%Enter paths of the input files:
input_path_NI = "input/a3NI.csv";
input_path_MR = "input/a3MR.csv";
%////////////////////////////////%

%% 1) Data acquisition
acquisition
%% 2) Data conditioning
%load input/sample_workspace_1
conditioning

%% 3) Extraction of friction, acceleration and distance
%load input/sample_workspace_2
extraction

%% 4) Optimization of the model
%load input/sample_workspace_3
optimization

%% 5) Visualization
%load input/sample_workspace_4
visualization