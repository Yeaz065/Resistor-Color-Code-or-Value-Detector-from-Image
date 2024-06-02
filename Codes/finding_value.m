%% calculating value of each resistor
plots=length(resimg);
for r=1:length(resimg)
    run('finding_colorband.m')
    resValue(r)= (Band1*10+Band2)*10^Band3; %equation of finding value from color code
    
end
  disp(resValue)
%% diplaying images of resistors and values of the resistors in same window
axes(handles.figure1)
for i=1:length(resValue)
    subplot(plots,1,i),imshow(resimg{i});
     title(['value of resistor no ' num2str(i) ' is ' num2str(resValue(i)) ' ohm'],'color','w');
end
