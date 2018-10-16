clear
fullURL = 'https://www.bilibili.com/ranking/bangumi/13/1/3/';
aim = urlread(fullURL);
expr={'class="title">.+?</a>';
    '<div class="bangumi-info">.+?</span>';
    '<i class="fav"></i>.+?</span>';
    '<div>[0-9]+</div>';
     };
for i=1:4
    ori{i}=regexp(aim,expr{i},'match');
end
name=regexp(ori{1,1},'>.+?<','match');%番剧名称
gx=regexp(ori{1,2},'>[0-9]+<','match');%更新到第几话
np=regexp(ori{1,3},'i>.+?<','match');%追番人数
hot=regexp(ori{1,4},'>[0-9]+<','match');%热度


 for i=1:50
     answ{i,1}=char(string(name{1,i}));
     answ{i,1}=answ{i,1}(2:length(answ{i,1})-1);
     
     answ{i,2}=char(string(gx{1,i}));
     if(~isempty(answ{i,2}))
         answ{i,2}=answ{i,2}(2:length(answ{i,2})-1);
     else
         answ{i,2}=0;
     end
     
     answ{i,3}=char(string(np{1,i}));
     answ{i,3}=answ{i,3}(3:length(answ{i,3})-1);
     
     answ{i,4}=char(string(hot{1,i}));
     answ{i,4}=answ{i,4}(2:length(answ{i,4})-1);
 end
 
 filename = [regexprep(datestr(now),':','_'),'.xlsx'];
 %filename = 'test.xlsx';
 xlswrite(filename,answ)