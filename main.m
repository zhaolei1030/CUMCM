%% 1
%城市分类
zong=dlmread('renwu.txt')
k1=1;
k2=1;
k3=1;
k4=1;
k5=1;
k6=1;
for i=1:833
	if zong(i,2)>113.6
		a(k5,:)=zong(i,:);
		k5=k5+1;
	else b(k6,:)=zong(i,:) ;
		k6=k6+1;
	end
end
for i=1:346
	if a(i,1)*1.533+78.94359<a(i,2)
		shenzhen(k1,:)=a(i,:);
		k1=k1+1;
	else dongguan(k2,:)=a(i,:)
		k2=k2+1;
	end
end
for i=1:487
	if b(i,1)*(-0.7162)+129.7581<b(i,2)
		guangzhou(k3,:)=b(i,:);
		k3=k3+1;
	else foshan(k4,:)=b(i,:);
		k4=k4+1;
	end
end
huiyuan=dlmread('huiyuan.txt')
%计算四个城市每个任务方圆十公里内的会员密度
s=pi*10*10; % 以任务为圆心， 10km为半径的圆的面积
for i=1:197
	sum=0;
	x1=shenzhen(i,2);
	y1=shenzhen(i,1);
	for m=1:1865
		x2=huiyuan(m,2);
		y2=huiyuan(m,1);
		y=panduan(x1,y1,x2,y2);
		sum=sum+y;
	end
	szhy(i,1)=sum;
end
szhymd=szhy./s ;
for i=1:313
	x1=guangzhou(i,2);
	y1=guangzhou(i,1);
	sum=0;
	for m=1:1865
		x2=huiyuan(m,2);
		y2=huiyuan(m,1);
		y=panduan(x1,y1,x2,y2);
		sum=sum+y;
	end;
	gzhy(i,1)=sum;
end
gzhymd=gzhy./s ;
for i=1:174
	x1=foshan(i,2);
	y1=foshan(i,1);
	sum=0;
	for m=1:1865
		x2=huiyuan(m,2);
		y2=huiyuan(m,1);
		y=panduan(x1,y1,x2,y2);
		sum=sum+y;
	end
	fshy(i,1)=sum;
end
fshymd=fshy./s ;
for i=1:149
	x1=dongguan(i,2);
	y1=dongguan(i,1);
	sum=0;
	for m=1:1865
		x2=huiyuan(m,2);
		y2=huiyuan(m,1);
		y=panduan(x1,y1,x2,y2);
		sum=sum+y;
	end
	dghy(i,1)=sum;
end
dghymd=dghy./s ;
%计算四个城市每个任务方圆十公里内的任务密度和距离市中心的远近
s=pi*10*10;
for i=1:174
	x1=foshan(i,2);
	y1=foshan(i,1);
	sum=0;
	for m=1:174
		x2=foshan(m,2);
		y2=foshan(m,1);
		y=panduan(x1,y1,x2,y2);
		sum=sum+y;
	end
	fsrw(i,1)=sum-1;
end
fsrwmd=fsrw./s ;
for i=1:75
	x1=112.67+0.01*i;
	for m=1:57
		y1=22.70+0.01*m;
		q=0;
		for ui=1:174
			x2=foshan(ui,2);
			y2=foshan(ui,1);
			q=q+sjjl(x1,y1,x2,y2);
		end
		zhongxin3(i,m)=q;
	end
end
zxmin3=min(min(zhongxin3));
[heng3,zong3]=find(zhongxin3==zxmin3);
xfs=112.67+0.01*heng3 ;
yfs=22.70+0.01*zong3;
for i=1:174
	x2=foshan(i,2);
	y2=foshan(i,1);
	juli3(i,1)=sjjl(xfs,yfs,x2,y2);
end
%
s=pi*10*10;
for i=1:313
	x1=guangzhou(i,2);
	y1=guangzhou(i,1);
	sum=0;
	for m=1:313
		x2=guangzhou(m,2);
		y2=guangzhou(m,1);
		y=panduan(x1,y1,x2,y2);
		sum=sum+y;
	end
	gzrw(i,1)=sum-1;
end
gzrwmd=gzrw./s ;
for i=1:50
	x1=113.10+0.01*i;
	for m=1:93
		y1=22.70+0.01*m;
		q=0;
		for ui=1:313
			x2=guangzhou(ui,2);
			y2=guangzhou(ui,1);
			q=q+sjjl(x1,y1,x2,y2);
		end
		zhongxin1(i,m)=q;
	end
end

zxmin1=min(min(zhongxin1));
[heng1,zong1]=find(zhongxin1==zxmin1);
xgz=113.10+0.01*heng1;
ygz=22.70+0.01*zong1;
for i=1:313
	x2=guangzhou(i,2);
	y2=guangzhou(i,1);
	juli1(i,1)=sjjl(xgz,ygz,x2,y2);
end
%
s=pi*10*10;
for i=1:149
	x1=dongguan(i,2);
	y1=dongguan(i,1);
	sum=0;
	for m=1:149
		x2=dongguan(m,2);
		y2=dongguan(m,1);
		y=panduan(x1,y1,x2,y2);
		sum=sum+y;
		end
	dgrw(i,1)=sum-1;
end
dgrwmd=dgrw./s ;
for i=1:52
	x1=113.59+0.01*i;
		for m=1:109
			y1=22.64+0.01*m;
			q=0;
			for ui=1:149
				x2=dongguan(ui,2);
				y2=dongguan(ui,1);
				q=q+sjjl(x1,y1,x2,y2);
			end
		zhongxin2(i,m)=q;
		end
end

zxmin2=min(min(zhongxin2));
[heng2,zong2]=find(zhongxin2==zxmin2);
xdg=113.59+0.01*heng2;
ydg=22.67+0.01*zong2;
for i=1:149
	x2=dongguan(i,2);
	y2=dongguan(i,1);
	juli2(i,1)=sjjl(xdg,ydg,x2,y2);
end
%
s=pi*10*10;
for i=1:197
	x1=shenzhen(i,2);
	y1=shenzhen(i,1);
	sum=0;
	for m=1:197
		x2=shenzhen(m,2);
		y2=shenzhen(m,1);
		y=panduan(x1,y1,x2,y2);
		sum=sum+y;
	end
	szrw(i,1)=sum-1;
end
szrwmd=szrw./s ;
for i=1:71
	x1=113.79+0.01*i;
	for m=1:49
		y1=22.48+0.01*m;
		q=0;
		for ui=1:197
			x2=shenzhen(ui,2);
			y2=shenzhen(ui,1);
			q=q+sjjl(x1,y1,x2,y2);
		end
		zhongxin4(i,m)=q;
	end
end
zxmin4=min(min(zhongxin4));
[heng4,zong4]=find(zhongxin4==zxmin4);
xsz=113.79+0.01*heng4 ;
ysz=22.48+0.01*zong4;
for i=1:197
	x2=shenzhen(i,2);
	y2=shenzhen(i,1);
	juli4(i,1)=sjjl(xsz,ysz,x2,y2);
end
guangzhou=[guangzhou gzhymd gzrwmd juli1];
dongguan=[dongguan dghymd dgrwmd juli2];
foshan=[foshan fshymd fsrwmd juli3];
shenzhen=[shenzhen szhymd szrwmd juli4];
%计算四个城市每个任务周围10km的会员平均信誉度
for i=1:313
	x1=guangzhou(i,2);
	y1=guangzhou(i,1);
	sum=0;
	for m=1:1865
		x2=huiyuan(m,2);
		y2=huiyuan(m,1);
		y=panduan(x1,y1,x2,y2);
		if y==1
			sum=sum+log(huiyuan(m,4));
		end
	end
	gzhyxy(i,1)=mean(sum);
end
for i=1:149
	x1=dongguan(i,2);
	y1=dongguan(i,1);
	sum=0;
	for m=1:1865
		x2=huiyuan(m,2);
		y2=huiyuan(m,1);
		y=panduan(x1,y1,x2,y2);
		if y==1
			sum=sum+log(huiyuan(m,4));
		end
	end
	dghyxy(i,1)=mean(sum);
end
for i=1:174
	x1=foshan(i,2);
	y1=foshan(i,1);
	sum=0;
	for m=1:1865
		x2=huiyuan(m,2);
		y2=huiyuan(m,1);
		y=panduan(x1,y1,x2,y2);
		if y==1
			sum=sum+log(huiyuan(m,4));
		end
	end
	fshyxy(i,1)=mean(sum);
end

for i=1:197
	x1=shenzhen(i,2);
	y1=shenzhen(i,1);
	sum=0;
	for m=1:1865
		x2=huiyuan(m,2);
		y2=huiyuan(m,1);
		y=panduan(x1,y1,x2,y2);
		if y==1
			sum=sum+log(huiyuan(m,4));
		end
	end
	szhyxy(i,1)=mean(sum);
end
%决策树
xunlian=dlmread('jueceshu.txt')
for i=1:833
	temp=xunlian(:,:);
	yuce=temp(i,:) ;
	temp(i,:)=[];
	jcs=fitctree(temp(:,[1 3 4]),temp(:,2));
	answer(i)=predict(jcs,yuce(1,[1 3 4]));
	panduan(i)=answer(i)-xunlian(i,2);
end
zhengque=length(find(panduan==0));
jcs=fitctree(xunlian(:,[1 3 4]),xunlian(:,2));
view(jcs,'mode','graph')


%%2
%logistic 回归及预测
x1=[guangzhou(:,7);dongguan(:,7);foshan(:,7);shenzhen(:,7)]
x2=[guangzhou(:,5);dongguan(:,5);foshan(:,5);shenzhen(:,5)]
x3=[guangzhou(:,3);dongguan(:,3);foshan(:,3);shenzhen(:,3)]
y0=[guangzhou(:,4);dongguan(:,4);foshan(:,4);shenzhen(:,4)]
[mdl,dev,stats] = glmfit([x1 x2 x3],y0, 'binomial', 'link', 'logit')
yfit = glmval(mdl,[x1 x2 x3],'probit');
y=zeros(size(yfit));
y(yfit>0.5)=1;
scatter(1:length(y0-y), y0-y,20,'filled','k');
accuracy=find(y0-y==0)/length(y);
mean(yfit)
yfit = glmval(mdl,x7(:,[3 2 1]),'probit');
accuracy=find(y0-y==0)/length(y);
%%3
%打包方法
zong=dlmread('paixu2.txt')
A=zeros(1,5);
num=1;
for i=1:833
	if kjz(zong(i,:))==0
		x1=zong(i,2);
		y1=zong(i,1);
		k1=1;
		A(num,1)=i;
		zong(i,:)=[0 0 0 0];
		for m=1:833
			if kjz(zong(m,:))==0
				x2=zong(m,2);
				y2=zong(m,1);
				if panduan2(x1,y1,x2,y2)==1
					if k1<5
						k1=k1+1 ;
						A(num,k1)=m;
						zong(m,:)=[0 0 0 0];
					end
				end
			end
		end
		num=num+1
	end
end

%打包后每个包内信息提取
zong=dlmread('paixu2.txt')
for i=1:369
	huiyuan=0;
	juli=0;
	for k=1:5
		temp=A(i,k);
		if temp~=0
			if k~=5
				huiyuan=huiyuan+zong(temp,3);
				juli=juli+zong(temp,4)
			else
				huiyuan=huiyuan+zong(temp,3);
				juli=juli+zong(temp,4)
				hj(i,1)=huiyuan/5;
				hj(i,2)=juli/5;
				hj(i,3)=5
			end
		else
			hj(i,1)=huiyuan/(k-1);
			hj(i,2)=juli/(k-1);
			hj(i,3)=k-1;
			break
		end
	end
end
%重新定价
%%Y = 64.6841233872 - 1.93981491299*log(hymd) + 0.21872756224*log(juli)
a=64.6841233872
beta1=- 1.93981491299
beta2=0.21872756224
xinjia=hj(:,3).*(a+beta1.*log(hj(:,1))+beta2.*log(hj(:,2)))
%logistic预测
yfit = glmval(mdl,[hj(:,2) hj(:,1) xinjia],'probit');
p=mean(yfit)

%%4
%城市分类
zong=dlmread('fujian3.txt')
k1=1;
k2=1;
k3=1;
k4=1;
k5=1;
k6=1;
for i=1:2066
	if zong(i,2)>113.6
		a(k5,:)=zong(i,:);
		k5=k5+1;
	else b(k6,:)=zong(i,:) ;
		k6=k6+1;
	end
end
for i=1:557
	if a(i,1)*1.533+78.94359<a(i,2)
		shenzhen(k1,:)=a(i,:);
		k1=k1+1;
	else dongguan(k2,:)=a(i,:)
		k2=k2+1;
	end
end
for i=1:1509
	if b(i,1)*(-0.7162)+129.7581<b(i,2)
		guangzhou(k3,:)=b(i,:);
		k3=k3+1;
	else foshan(k4,:)=b(i,:);
		k4=k4+1;
	end
end
guangzhou=[guangzhou;foshan]
huiyuan=dlmread('huiyuan.txt')

%与第二问类似，计算每个任务数方圆十公里内的任务密度，距离市中心远近
s=pi*10*10;
for i=1:557
	sum=0;
	x1=shenzhen(i,2);
	y1=shenzhen(i,1);
	for m=1:1865
		x2=huiyuan(m,2);
		y2=huiyuan(m,1);
		y=panduan(x1,y1,x2,y2);
		sum=sum+y;
	end
	szhy(i,1)=sum;
end
szhymd=szhy./s ;

for i=1:1509
	x1=guangzhou(i,2);
	y1=guangzhou(i,1);
	sum=0;
	for m=1:1865
		x2=huiyuan(m,2);
		y2=huiyuan(m,1);
		y=panduan(x1,y1,x2,y2);
		sum=sum+y;
	end;
	gzhy(i,1)=sum;
end

gzhymd=gzhy./s ;
for i=1:50
	x1=113.10+0.01*i;
	for m=1:93
		y1=22.70+0.01*m;
		q=0;
		for ui=1:1509
			x2=guangzhou(ui,2);
			y2=guangzhou(ui,1);
			q=q+sjjl(x1,y1,x2,y2);
		end
		zhongxin1(i,m)=q;
	end
end

zxmin1=min(min(zhongxin1));
[heng1,zong1]=find(zhongxin1==zxmin1);
xgz=113.10+0.01*heng1;
ygz=22.70+0.01*zong1;

for i=1:1509
	x2=guangzhou(i,2);
	y2=guangzhou(i,1);
	juli1(i,1)=sjjl(xgz,ygz,x2,y2);
end
for i=1:71
	x1=113.79+0.01*i;
	for m=1:49
		y1=22.48+0.01*m;
		q=0;
		for ui=1:557
			x2=shenzhen(ui,2);
			y2=shenzhen(ui,1);
			q=q+sjjl(x1,y1,x2,y2);
		end
		zhongxin4(i,m)=q;
	end
end

zxmin4=min(min(zhongxin4));
[heng4,zong4]=find(zhongxin4==zxmin4);
xsz=113.79+0.01*heng4 ;
ysz=22.48+0.01*zong4;
for i=1:557
	x2=shenzhen(i,2);
	y2=shenzhen(i,1);
	juli4(i,1)=sjjl(xsz,ysz,x2,y2);
end

%此问采取两种打包和拟合函数两种方式计算完成概率
%打包方式
zong=[guangzhou gzhymd juli1;shenzhen,szhymd,juli4]
A=zeros(1,5);
num=1;
for i=1:2066
	if kjz(zong(i,:))==0
		x1=zong(i,2);
		y1=zong(i,1);
		k1=1;
		A(num,1)=i;
		zong(i,:)=[0 0 0 0];
		for m=1:2066
			if kjz(zong(m,:))==0
				x2=zong(m,2);
				y2=zong(m,1);
				if panduan2(x1,y1,x2,y2)==1
					if k1<5
						k1=k1+1 ;
						A(num,k1)=m;
						zong(m,:)=[0 0 0 0];
					end
				end
			end
		end
		num=num+1;
	end
end

zong=[guangzhou gzhymd juli1;shenzhen,szhymd,juli4]
for i=1:445
	huiyuan=0;
	juli=0;
	for k=1:5
		temp=A(i,k);
		if temp~=0
			if k~=5
				huiyuan=huiyuan+zong(temp,3);
				juli=juli+zong(temp,4);
			else
				huiyuan=huiyuan+zong(temp,3);
				juli=juli+zong(temp,4);
				hj(i,1)=huiyuan/5;
				hj(i,2)=juli/5;
				hj(i,3)=5
			end
		else
			hj(i,1)=huiyuan/(k-1);
			hj(i,2)=juli/(k-1);
			hj(i,3)=k-1;
			break
		end
	end
end
%Y = 64.6841233872 - 1.93981491299*log(hymd) + 0.21872756224*log(juli)
a=64.6841233872
beta1=- 1.93981491299
beta2=0.21872756224
x1=[szhymd;gzhymd]
x2=[juli4;juli1]
xinjia=a+beta1.*log(x1)+beta2.*log(x2)
yfit = glmval(mdl,[x2 x1 xinjia],'probit');
p=mean(yfit)

%第二种为拟合函数和补贴定价方案
%Y = 64.6841233872 - 1.93981491299*log(hymd) + 0.21872756224*log(juli)
a=64.6841233872
beta1=- 1.93981491299
beta2=0.21872756224
gzxinjia=a+beta1.*log(gzhymd)+beta2.*log(juli1)+1.95
szxinjia=a+beta1.*log(szhymd)+beta2.*log(juli4)+1.83
x1=[juli1;juli4]
x2=[gzhymd;szhymd]
x3=[gzxinjia;szxinjia]
yfit = glmval(mdl,[x1 x2 x3],'probit');
p=mean(yfit)

%%子程序
%%panduan
function y=panduan(x1,y1,x2,y2)
	juli=sqrt(((y2-y1)*111).^2+((x2-x1)*cos(y1/180*pi)*111).^2);
	if juli>=10
		y=0;
	else
		y=1;
	end
end
%%panduan2
function y=panduan2(x1,y1,x2,y2)
	juli=sqrt(((y2-y1)*111).^2+((x2-x1)*cos(y1/180*pi)*111).^2);
	if juli>=2
		y=0;
	else
		y=1;
	end
end

%%sjll
function y=sjjl(x1,y1,x2,y2)
(((y2-y1)*111).^2+((x2-x1)*cos(y1/180*pi)*111).^2);
end
%%kjz
function y=kjz(x)
if x==[0 0 0 0]
	y=1;
else y=0;
end
%%kjz2
function y=kjz2(x)
if x==[0 0 ]
	y=1;
else y=0;
end