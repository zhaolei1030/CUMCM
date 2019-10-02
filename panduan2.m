function y=panduan2(x1,y1,x2,y2)
   juli=sqrt(((y2-y1)*111).^2+((x2-x1)*cos(y1/180*pi)*111).^2);
   if juli>=2
       y=0;
   else 
       y=1;
   end
   
end