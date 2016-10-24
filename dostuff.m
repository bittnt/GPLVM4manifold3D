bing_fid = fopen('/home/bittnt/BING/NYUD/Local/img_5638bing_100.txt','r');
boxes_bing = zeros(4,100);
for i = 1 : 100
    tmp = fgetl(bing_fid);
    boxes_bing(:,i) = str2num(tmp);
end
fclose(bing_fid);

our_fid = fopen('/home/bittnt/BING/NYUD/Local/img_5638_our100.txt','r');
boxes_our = zeros(4,100);
for i =1 : 100
    tmp = fgetl(our_fid);
    boxes_our(:,i) = str2num(tmp);
end
fclose(our_fid);
%string strXmin, strYmin, strXmax, strYmax;
matheat_bing = zeros(size(img,1),size(img,2));
sum_matheat_bing = zeros(size(img,1),size(img,2));
for i =1 : 100
    Xmin = min(boxes_bing(1,i)+1,size(img,2));
    Ymin = min(boxes_bing(2,i)+1,size(img,1));
    Xmax = min(boxes_bing(3,i)+1,size(img,2));
    Ymax = min(boxes_bing(4,i)+1,size(img,1));
    matheat_bing(Ymin:Ymax,Xmin:Xmax) = 1;
    sum_matheat_bing = sum_matheat_bing + matheat_bing;
end
sum_matheat_bing = sum_matheat_bing/100;
heatmap_bing = sum_matheat_bing*255;
imwrite(uint8(heatmap_bing),['bing_5638.png'],'png');


matheat_our = zeros(size(img,1),size(img,2));
sum_matheat_our= zeros(size(img,1),size(img,2));
for i =1 : 100
    Xmin = min(boxes_our(1,i)+1,size(img,2));
    Ymin = min(boxes_our(2,i)+1,size(img,1));
    Xmax = min(boxes_our(3,i)+1,size(img,2));
    Ymax = min(boxes_our(4,i)+1,size(img,1));
    matheat_our(Ymin:Ymax,Xmin:Xmax) = 1;
    sum_matheat_our = sum_matheat_our + matheat_our;
end
sum_matheat_our = sum_matheat_our/100;
heatmap_our = sum_matheat_our*255;
imwrite(uint8(heatmap_our),['our_5638.png'],'png');