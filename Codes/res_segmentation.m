%% Input image
%close all;
%Iinput=imread('res7clc.jpg');
Igray=rgb2gray(Iinput);
%imshow(Iinput);
%figure;
%imshow(Igray);
%figure;
%% Binary mask of main image
[BWmain,~] = segmentImageN(Igray);
%imshow(BWmain);
%figure;
%% structuring according to brightness
hsv=rgb2hsv(Iinput);
v = hsv(:,:,3); 
avgV = mean(v(:));
%% 
if avgV < .9
   se = strel('square',41);
   Iopenned = imopen(BWmain,se);
   %imshow(Iopenned);
elseif avgV > .9
       se = strel('square',18);
       Iopenned = imopen(BWmain,se);
       %imshow(Iopenned);
end        
%% extracting features
Iregion = regionprops(Iopenned, 'centroid');
[labeled,numObjects] = bwlabel(Iopenned,4);
stats = regionprops(labeled,'Eccentricity','Area','BoundingBox');
areas = [stats.Area];
eccentricities = [stats.Eccentricity];
%% Use feature analysis to count objects
idxOfResistors = find(eccentricities);
statsDefects = stats(idxOfResistors);

axes(handles.axes2)
imshow(Iinput);
hold on;
%% detecting whether the component is a resistor or not
for idx = 1 : length(idxOfResistors)
    res{idx} = imcrop(Iinput,statsDefects(idx).BoundingBox);
end
m=1;
for i=1:length(res)
    check=0;
    [BWres,~]= ResCheck(res{i});
    se = strel('disk',6);
    Iopennedres = imopen(BWres,se);
    Iregion = regionprops(Iopennedres, 'centroid');
    [labeled,numObjectsRes] = bwlabel(Iopennedres,4);
    if numObjectsRes~=0
        h = rectangle('Position',statsDefects(i).BoundingBox,'LineWidth',2);
        set(h,'EdgeColor',[.75 0 0])
        hold on;
        position=[statsDefects(i).BoundingBox(1,1)-50 statsDefects(i).BoundingBox(1,2)-50];
        text('Position',position,'string',num2str(m));
        resimg{m} = imcrop(Iinput,statsDefects(i).BoundingBox);
        m=m+1;
        check=1;
    end
    if check ~=1
        [BWres,~]= ResCheck2(res{i});
        se = strel('disk',2);
        Iopennedres = imopen(BWres,se);
        Iregion = regionprops(Iopennedres, 'centroid');
        [labeled,numObjectsRes] = bwlabel(Iopennedres,4);
        if numObjectsRes~=0
            h = rectangle('Position',statsDefects(i).BoundingBox,'LineWidth',2);
            set(h,'EdgeColor',[.75 0 0])
            hold on;
            position=[statsDefects(i).BoundingBox(1,1)-50 statsDefects(i).BoundingBox(1,2)-50];
            text('Position',position,'string',num2str(m));
            resimg{m} = imcrop(Iinput,statsDefects(i).BoundingBox);
            m=m+1;
            check=1;
        end
    end
end

title(['Here we have ', num2str(length(resimg)), ' resistors in the image!'],'color','w');