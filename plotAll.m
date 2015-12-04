% User Import of files from excel which will also  store filename for use
% in program output and saving (could build directories also)

%clear old data to avoid corruption!
clear all;
close all;
clc;

disp('Knee Test Import Program!');
disp('Ver 0.2.0 12/4/2015');
disp('');
%uigetfile returns filename
filename = uigetfile('*.xls','Select Knee Data File');
%import the actual excel data from the file
disp('Importing file...');

[ForceN,SPDisplacementmm,Rotationdeg,sheetNames] = importWorkbook(filename);
disp('File import complete!');
%create a new field to store the field names corresponding to test sequences 
%within the TestData structure
disp('Test names:');
disp(sheetNames);
%for loop to plot each data
for i = 1:1:length(sheetNames)
    
    %plot on a new window the corresponding data piece
    [name] = TestData.names(i);
    name = name{1};
    h = figure ('Name', name);
    plot(TestData.data.(name));
    %plot all your figures here
    
    
    %save as png
    outFileName = strcat(name, '_', (filename(1:max(size(filename))-4)));
    outFileName = strcat(outFileName,'.png');
    disp('File Name: ');
    disp(outFileName);
    print(h,'-dpng', outFileName);
end


%clear data to avoid corruption!
%clear all