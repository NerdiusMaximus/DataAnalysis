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

bs = strsplit(filename,'-');
kneeName = bs{1};

[ForceN,SPDisplacementmm,Rotationdeg,sheetNames] = importWorkbook(filename);
disp('File import complete!');
disp('Test names:');
disp(sheetNames);

% handle Figure directory
if isdir('Images') == 0 
    mkdir('Images');
    addpath('Images');
end

dir = cd;

%for loop to plot each data
for i = 1:1:length(sheetNames)
    
    %plot on a new window the corresponding data piece
    name = sheetNames{i};

    %plot all your figures here
    h = plotLines(ForceN(:,i), SPDisplacementmm(:,i),kneeName,sheetNames{i});
    
    %save as png
    outFileName = strcat(name, '_', (filename(1:max(size(filename))-4)));
    outFileName = strcat(outFileName,'.png');
    
    cd('./Images')
    
    disp('File Name: ');
    disp(outFileName);
    
    print(h,'-dpng', outFileName);
    cd('../');
end

%clear data to avoid corruption!
%clear all