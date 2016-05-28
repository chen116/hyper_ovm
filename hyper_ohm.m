
%%
%individual figures: lateness
close all

clc
clear
st=datestr(now);
% make sure they have same length in char counts
% gives vm folder names
%ovt = '/cxs_out';
 %ovt = '/sched_out';

vms = cellstr(['xen-hyper-ovem-data']);
%vms = cellstr(['rtxen-480';'  xen-480']);
%vms = cellstr(['kvm-500']);
%vms = cellstr(['rtxen-480-0.2-8.4-fine';'  xen-480-0.2-8.4-fine';'  kvm-480-0.2-8.4-fine';' bare-480-0.2-8.4-fine']);
%vms = cellstr(['rtxen-480-3.2-8.4-fine';'  xen-480-3.2-8.4-fine';'  kvm-480-3.2-8.4-fine';' bare-480-3.2-8.4-fine']);

%vms = cellstr(['rtxen-480';'  xen-480';'  kvm-480';' bare-480']);
%ratio files name under the folders above'
    dists = cellstr(['bimo-medium_uni-longRTXen   ';...
%dists = cellstr([
                 'bimo-medium_uni-moderate    ';...
                 ]);
file_dists = cellstr(['  bimo-480-jobs';...
                      ' heavy-480-jobs';...
                      'medium-480-jobs';...
                      ' light-480-jobs';...
                 ]);
dists_title = cellstr(['uni-moderate result';
                       '   uni-light result']);
% distributions on x-axis
% 480, with folder name xen, rtxen, they are 8 cores
%xaxis=[0.2 0.4 0.6 0.8 1 1.2 1.4 1.6 1.8 2 2.2 2.4 2.6 2.8 3 3.2 3.4 3.6 3.8 4 4.2 4.4 4.6 4.8 5 5.2 5.4 5.6 5.8 6 6.2 6.4 6.6 6.8 7 7.2 7.4 7.6 7.8 8 8.2 8.4];

% 484, 8 cores
%xaxis=[3.2 3.6 4.2 4.6 5.2 5.6 6.2 6.6 7.2 7.6 8 8.2 8.4];
%xaxis=[3.2 3.4 3.6 3.8 4.2 4.4 4.6 4.8 5.2 5.4 5.6 5.8 6.2 6.4 6.6 6.8 7.2 7.4 7.6 7.8 8 8.2 8.4];
domID='1';%rtxen
%domID='1';%xen
xaxis=[1 2 3 4 5 6 7 8];
% line, maker style
lw=[10,6,4,3];
ms=[12,10,8,6];
ls=cellstr(['ob';'xg';'xm';'^k']);

pmod = cellstr(['_1.0_';'_2.0_';'_3.0_';'_4.0_';'_5.0_';'_6.0_';'_7.0_';'_8.0_']);
plong = cellstr(['_1_';'_2_';'_3_';'_4_';'_5_';'_6_';'_7_';'_8_']);

plong_lateness{1}=[];
pmod_lateness{1}=[];
p_min=ones(2,8).*inf;
min_cnt=-inf;
cnt=-inf;
%figure
for j=1:length(dists)
    c{1}=[];
    for i=1:length(vms)
        for m=1:8
            c{m}=[];
            if(cnt>min_cnt)
               min_cnt=cnt; 
            end
              cnt=1;
            for k=0:0


                if(j<2) %long
                    %plong_lateness{m}=[];
                    strcat(strtrim(vms{i}),'/',dists{j},plong{m},num2str(k))
                    fid = fopen(strcat(strtrim(vms{i}),'/',dists{j},plong{m},num2str(k)));
                else
                    %pmod_lateness{m}=[];
                    fid = fopen(strcat(strtrim(vms{i}),'/',dists{j},pmod{m},num2str(k)));
                    strcat(strtrim(vms{i}),'/',dists{j},pmod{m},num2str(k))
                
                end
                            
                tline = fgets(fid);

                while ischar(tline)

                    if(1==(isspace(tline)))
                     
                    elseif(ischar(tline))

                        oline = strsplit(strtrim(tline));
% oline(1)
                             
                         if (strcmp(oline(1),domID))
                             
%                             if(str2double(oline(6))<0)
%                                 tmp=c{m};
                                ov = str2double(oline(3));
                                tmp(cnt)=ov;
                                c{m}=tmp;
                                cnt=cnt+1;
                                if(ov < p_min(j,m))
                                   p_min(j,m) = ov;
                                end
%                             end
                        end
                        

                    end
                    tline = fgets(fid);
                end
                fclose(fid);
                

    %         schdublilty(i,:) = (suc./sum)';
    %         %subplot(2,2,j);
    %         plot(xaxis,schdublilty(i,:),ls{i},'LineWidth',lw(i),'MarkerSize',ms(i))
    % 
    %         hold on
            end
        end
    end

    if (j<2)
        plong_lateness=c;
    else
        pmod_lateness=c;
    end
end
min_cnt
st
datestr(now)
%%
%close all
clc
dists_title = cellstr(['Long Period        ';...
                       'Moderate Period    ';...
                 ]);
%              dists_title = cellstr(['Scheduling Overhead - Long Period        ';...
%                                     'Scheduling Overhead - Moderate Period    ';...
%                  ]);
             h=figure('position', [0, 0, 1275, 400])
tmp_lateness={plong_lateness, pmod_lateness};
for k = 1:length(tmp_lateness)
    lateness=tmp_lateness{k};
    cnt=1;
    xmat=[];
    mat=[];
    for i=1:8
       if(~isempty(lateness{i}))
           tmp = lateness{i};
           for j=1:length(lateness{i})

               mat(cnt)=tmp(j).*1000;
               xmat(cnt)=i;
               cnt=cnt+1;
           end
       end
    end
%     figure
    subplot(1,2,k)
    boxplot(mat,xmat)
    h_title=title(strcat('Hypervisor-Xen-Credit-',strtrim(dists_title{k})),'Interpreter', 'none');
    set(h_title,'FontSize',18);    
    set(gca,'fontsize',15)
    xlabel('Normalized Task Set Utilization','FontSize',15)
    ylabel('Time (ms)','FontSize',15)
    ylim([0 .005])
       

end
set(h,'Units','Inches');

pos = get(h,'Position');
pos
%set(h,'PaperPositionMode','Auto','PaperSize',[1, 1])
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3)-3, pos(4)])
print(h,'bimo-rtxen-hypervisor-scheduling-overhead','-dpdf','-r0')
%print(h,'bimo-rtxen-scheduling-overhead','-dpdf','-r0')
p_min'
% cnt=1;
% xmat=[];
% mat=[];
% for i=1:8
%    if(~isempty(plong_lateness{i}))
%        tmp = plong_lateness{i};
%        for j=1:length(plong_lateness{i})
% 
%            mat(cnt)=tmp(j);
%            xmat(cnt)=i;
%            cnt=cnt+1;
%        end
%    end
% end
% figure
% 
% boxplot(mat,xmat)
