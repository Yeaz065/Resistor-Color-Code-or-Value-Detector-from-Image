%% we will check the bands of the resistors one by one
j=1;
found=0;
%r=1;
%imshow(resimg{r});
clear bandstruct;
%% brown
[BWband,~]= createMaskbrown(resimg{r});
%imshow(BWband);
%% structuring
if avgV < .9
    se = strel('disk',1);
    Iopennedband = imopen(BWband,se);
    %imshow(Iopennedband);
elseif avgV > .9
    se = strel('disk',3);
    Iopennedband = imopen(BWband,se);
    %imshow(Iopennedband);
end
%% 
Iregion = regionprops(Iopennedband, 'centroid');
[labeled,numObjects] = bwlabel(Iopennedband,4);
%%
if numObjects ~=0
   statsBr = regionprops(labeled,'Eccentricity','Area','BoundingBox');
   areas = [statsBr.Area];
   eccentricities = [statsBr.Eccentricity];
   [M,I] = max(areas);
   bandstruct(j).Eccentricity=statsBr(I).Eccentricity;
   bandstruct(j).Area=statsBr(I).Area;
   bandstruct(j).BoundingBox=statsBr(I).BoundingBox;
   bandstruct(j).Value=1;
   j=j+1;
   
end
%% orange
[BWband,~]= createMaskorange(resimg{r});
%imshow(BWband);
%% structuring
se = strel('disk',1);
Iopennedband = imopen(BWband,se);
%imshow(Iopennedband);
%% 
Iregion = regionprops(Iopennedband, 'centroid');
[labeled,numObjects] = bwlabel(Iopennedband,4);
%%
if numObjects ~=0
   statsO = regionprops(labeled,'Eccentricity','Area','BoundingBox');
   areas = [statsO.Area];
   eccentricities = [statsO.Eccentricity];
   [M,I] = max(areas);
   bandstruct(j).Eccentricity=statsO(I).Eccentricity;
   bandstruct(j).Area=statsO(I).Area;
   bandstruct(j).BoundingBox=statsO(I).BoundingBox;
   bandstruct(j).Value=3;
   j=j+1;
    
end
%% red
if avgV < .9
    [BWband,~]= createMaskred(resimg{r});
    %imshow(BWband);
elseif avgV > .9
        [BWband,~]= createMaskredAlt(resimg{r});
        %imshow(BWband);
    end
%% structuring
se = strel('disk',0);
Iopennedband = imopen(BWband,se);
%imshow(Iopennedband);
%% 
Iregion = regionprops(Iopennedband, 'centroid');
[labeled,numObjects] = bwlabel(Iopennedband,4);
%%
if numObjects ~=0
   statsR = regionprops(labeled,'Eccentricity','Area','BoundingBox');
   areas = [statsR.Area];
   eccentricities = [statsR.Eccentricity];
   [M,I] = max(areas);
   bandstruct(j).Eccentricity=statsR(I).Eccentricity;
   bandstruct(j).Area=statsR(I).Area;
   bandstruct(j).BoundingBox=statsR(I).BoundingBox;
   bandstruct(j).Value=2;
   j=j+1;
   
end
%% black

[BWband,~]= createMaskblack(resimg{r});
%imshow(BWband);
%% structuring
se = strel('disk',0);
Iopennedband = imopen(BWband,se);
%imshow(Iopennedband);
%% 
Iregion = regionprops(Iopennedband, 'centroid');
[labeled,numObjects] = bwlabel(Iopennedband,4);
%%
if numObjects ~=0
   statsB = regionprops(labeled,'Eccentricity','Area','BoundingBox');
   areas = [statsB.Area];
   eccentricities = [statsB.Eccentricity];
   [M,I] = max(areas);
   bandstruct(j).Eccentricity=statsB(I).Eccentricity;
   bandstruct(j).Area=statsB(I).Area;
   bandstruct(j).BoundingBox=statsB(I).BoundingBox;
   bandstruct(j).Value=0;
   j=j+1;
    
end
%% yellow
[BWband,~]= createMaskyellowAlt(resimg{r});
%imshow(BWband);
%% structuring
se = strel('disk',0);
Iopennedband = imopen(BWband,se);
%imshow(Iopennedband);
%% 
Iregion = regionprops(Iopennedband, 'centroid');
[labeled,numObjects] = bwlabel(Iopennedband,4);
%%
if numObjects ~=0
   statsY = regionprops(labeled,'Eccentricity','Area','BoundingBox');
   areas = [statsY.Area];
   eccentricities = [statsY.Eccentricity];
   [M,I] = max(areas);
   bandstruct(j).Eccentricity=statsY(I).Eccentricity;
   bandstruct(j).Area=statsY(I).Area;
   bandstruct(j).BoundingBox=statsY(I).BoundingBox;
   bandstruct(j).Value=4;
   j=j+1;
    
   found=1;
end
%%
if found~=1
    [BWband,~]= createMaskyellowAlt2(resimg{r});
    %imshow(BWband);
    %% structuring
    se = strel('disk',0);
    Iopennedband = imopen(BWband,se);
    %imshow(Iopennedband);
    %%
    Iregion = regionprops(Iopennedband, 'centroid');
    [labeled,numObjects] = bwlabel(Iopennedband,4);
    %%
    if numObjects ~=0
        statsY = regionprops(labeled,'Eccentricity','Area','BoundingBox');
        areas = [statsY.Area];
        eccentricities = [statsY.Eccentricity];
        [M,I] = max(areas);
        bandstruct(j).Eccentricity=statsY(I).Eccentricity;
        bandstruct(j).Area=statsY(I).Area;
        bandstruct(j).BoundingBox=statsY(I).BoundingBox;
        bandstruct(j).Value=4;
        j=j+1;
       
        found=1;
    end
end
if found~=1;
    [BWband,~]= createMaskyellow(resimg{r});
    %imshow(BWband);
    %% structuring
    se = strel('disk',0);
    Iopennedband = imopen(BWband,se);
    %imshow(Iopennedband);
    %%
    Iregion = regionprops(Iopennedband, 'centroid');
    [labeled,numObjects] = bwlabel(Iopennedband,4);
    %%
    if numObjects ~=0
        statsY = regionprops(labeled,'Eccentricity','Area','BoundingBox');
        areas = [statsY.Area];
        eccentricities = [statsY.Eccentricity];
        [M,I] = max(areas);
        bandstruct(j).Eccentricity=statsY(I).Eccentricity;
        bandstruct(j).Area=statsY(I).Area;
        bandstruct(j).BoundingBox=statsY(I).BoundingBox;
        bandstruct(j).Value=4;
        j=j+1;
       
    end
end
found=0;
%% Violet
[BWband,~]= createMaskvioletnew2(resimg{r});
%imshow(BWband);
%% structuring
se = strel('disk',0);
Iopennedband = imopen(BWband,se);
%imshow(Iopennedband);
%% 
Iregion = regionprops(Iopennedband, 'centroid');
[labeled,numObjects] = bwlabel(Iopennedband,4);
%%
if numObjects ~=0
   statsV = regionprops(labeled,'Eccentricity','Area','BoundingBox');
   areas = [statsV.Area];
   eccentricities = [statsV.Eccentricity];
   [M,I] = max(areas);
   bandstruct(j).Eccentricity=statsV(I).Eccentricity;
   bandstruct(j).Area=statsV(I).Area;
   bandstruct(j).BoundingBox=statsV(I).BoundingBox;
   bandstruct(j).Value=7;
   j=j+1;
    
  
end
%% Green
[BWband,~]= createMaskgreen(resimg{r});
%imshow(BWband);
%% structuring
se = strel('disk',0);
Iopennedband = imopen(BWband,se);
%imshow(Iopennedband);
%% 
Iregion = regionprops(Iopennedband, 'centroid');
[labeled,numObjects] = bwlabel(Iopennedband,4);
%%
if numObjects ~=0
   statsG = regionprops(labeled,'Eccentricity','Area','BoundingBox');
   areas = [statsG.Area];
   eccentricities = [statsG.Eccentricity];
   [M,I] = max(areas);
   bandstruct(j).Eccentricity=statsG(I).Eccentricity;
   bandstruct(j).Area=statsG(I).Area;
   bandstruct(j).BoundingBox=statsG(I).BoundingBox;
   bandstruct(j).Value=5;
   j=j+1;
    
end
%% for same bands
bandArea= [bandstruct.Area];
if max(find(bandArea))<3
    [~,Idx]=max(bandArea);
        if max(find(bandArea))==2
    bandstruct(3).Value=bandstruct(Idx).Value;
    bandstruct(3).BoundingBox=bandstruct(Idx).BoundingBox;

        end
        if max(find(bandArea))==1
             bandstruct(2).Value=bandstruct(Idx).Value;
              bandstruct(3).Value=bandstruct(Idx).Value;
              bandstruct(2).BoundingBox=bandstruct(Idx).BoundingBox;
              bandstruct(3).BoundingBox=bandstruct(Idx).BoundingBox;
        end
              
end    
%% 
s=size(resimg{r});
if s(1,2)>=s(1,1)
    %% check if flipped horizontally
     if  bandstruct(1).BoundingBox(1,1)+bandstruct(2).BoundingBox(1,1)+bandstruct(3).BoundingBox(1,1)<250
         bandnum=[ bandstruct(1).BoundingBox(1,1) bandstruct(2).BoundingBox(1,1) bandstruct(3).BoundingBox(1,1)];
         [~,I]=min(bandnum);
         Band1= bandstruct(I).Value;
         bandnum(I)=0;
         [~,I]=max(bandnum);
         Band3= bandstruct(I).Value;
         bandnum(I)=0;
     else
         bandnum=[ bandstruct(1).BoundingBox(1,1) bandstruct(2).BoundingBox(1,1) bandstruct(3).BoundingBox(1,1)];
         [~,I]=min(bandnum);
         Band3= bandstruct(I).Value;
         bandnum(I)=0;
         [~,I]=max(bandnum);
         Band1= bandstruct(I).Value;
         bandnum(I)=0;
    end
%% 
I=find(bandnum);
Band2= bandstruct(I).Value;


elseif s(1,1)>s(1,2)
    %% check if flipped vertically
     if  bandstruct(1).BoundingBox(1,2)+bandstruct(2).BoundingBox(1,2)+bandstruct(3).BoundingBox(1,2)<250
         bandnum=[ bandstruct(1).BoundingBox(1,2) bandstruct(2).BoundingBox(1,2) bandstruct(3).BoundingBox(1,2)];
         [~,I]=min(bandnum);
         Band1= bandstruct(I).Value;
         bandnum(I)=0;
         [~,I]=max(bandnum);
         Band3= bandstruct(I).Value;
         bandnum(I)=0;
     else
         bandnum=[ bandstruct(1).BoundingBox(1,2) bandstruct(2).BoundingBox(1,2) bandstruct(3).BoundingBox(1,2)];
         [~,I]=min(bandnum);
         Band3= bandstruct(I).Value;
         bandnum(I)=0;
         [~,I]=max(bandnum);
         Band1= bandstruct(I).Value;
         bandnum(I)=0;
    end
     %%
     I=find(bandnum);
     Band2= bandstruct(I).Value;
end