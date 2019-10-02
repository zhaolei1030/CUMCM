import pandas as pd
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
import numpy as np
#读取文本数据到DataFrame中，将数据转换为matrix，保存在dataSet中
import xlrd
df = pd.read_excel('D:\B\附件一：已结束项目任务数据.xls') # 打开xls文件
c = df.drop('任务号码',axis=1)
# print(c.values)
# print(c.shape)
dataSet = c.values[:,0:2]
# n_clusters=4，参数设置需要的分类这里设置成4类
kmeans = KMeans(n_clusters=4, random_state=0).fit(dataSet)
#center为各类的聚类中心，保存在df_center的DataFrame中给数据加上标签
center = kmeans.cluster_centers_
df_center = pd.DataFrame(center, columns=['x', 'y'])
#标注每个点的聚类结果
labels = kmeans.labels_
#将原始数据中的索引设置成得到的数据类别，根据索引提取各类数据并保存
df = pd.DataFrame(dataSet, index=labels, columns=['x', 'y'])
df1 = df[df.index==0]
df2 = df[df.index==1]
df3 = df[df.index==2]
df4 = df[df.index==3]
#绘图
plt.figure(figsize=(10,8), dpi=80)
axes = plt.subplot()
#s表示点大小，c表示color，marker表示点类型，DataFrame数据列引用参考博客其他文章
type1 = axes.scatter(df1.loc[:,['x']], df1.loc[:,['y']], s=50, c='red', marker='d')
type2 = axes.scatter(df2.loc[:,['x']], df2.loc[:,['y']], s=50, c='green', marker='*')
type3 = axes.scatter(df3.loc[:,['x']], df3.loc[:,['y']], s=50, c='brown', marker='p')
type4 = axes.scatter(df4.loc[:,['x']], df4.loc[:,['y']], s=50, c='black')
#显示聚类中心数据点
type_center = axes.scatter(df_center.loc[:,'x'], df_center.loc[:,'y'], s=40, c='blue')
plt.xlabel('x', fontsize=16)
plt.ylabel('y', fontsize=16)
axes.legend((type1, type2, type3, type4, type_center), ('0','1','2','3','center'), loc=1)
plt.show()

# import matplotlib.pyplot as plt
# from mpl_toolkits.mplot3d import Axes3D
# fig = plt.figure()
# ax = fig.add_subplot(111, projection='3d')
# X = [1, 1, 2, 2]
# Y = [3, 4, 4, 3]
# Z = [1, 2, 1, 1]
# ax.scatter(X, Y, Z)
# plt.show()