%��Raw_Husheng_Hangqing.m�ж�ȡԭʼ���ݣ��������֮��д�뵽�µ�xlsx�ļ���
clc;
clear all;
%�����ݵ���ṹ��
data=load('E:\����\��������\Raw_Hushen_Hangqing');
%��ȡ�ṹ������г�Ա�������������
names=fieldnames(data);
len=size(names);
data_index=[];
codes_index=[];
fields_index=[];
%�ҳ������к���'data'�ĳ�Ա������names�е�����
for i=1:len
    containData=regexp(names(i),'.+data.+');
    if (containData{1}==1)
        data_index=[data_index,i];
    end
end
%���������������names����ȡ�����к���'data'�ĳ�Ա����
datanames=names(data_index);
%ȫ���ĳ�Сд
filenames=lower(data.w_wsd_fields_0);
file_num=size(filenames,1);
data_num=size(datanames,1);
%����ÿ����Ա�������ӵ�һ�п�ʼ��ȡ��ÿ�������е�ͬһ�У�Ҳ����ͬһ��ָ��ģ���ƴ��һ���µľ���
%�µľ������ĳһ��ָ��ÿ�죨һ�У���ÿ����Ʊ�ϣ�һ�У�������
for i =1:file_num
    temp=[];
    for j =1:data_num
        mat_name=datanames(j);
        mat=eval(['data.',mat_name{1}]);
        temp=[temp,mat(:,i)];
    end
    %�����ƴ�õ��¾����ݴ浽files��ȥ
    files{i}=temp;
end

for i = 1:file_num-1
    xlswrite('E:\����\��������\hushen_tech.xlsx',files{i},filenames{i},'B4')
end