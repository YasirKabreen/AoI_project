clc,clear 
s1=[1 2 3]; 
s2=[1 2 3] ;
bl1=[0 1 ];  
bl2=[0 1 ];   

  a=[];
  for i=1 : length(s1)
      for j=1 : length(s2)
          for k=1 : length(bl1)
              for l=1 : length(bl2)
      a=[a;[s1(i),s2(j),bl1(k),bl2(l)]];
               end
          end
      end
  end
  
a
    x=zeros(length(a),length(a));
  n=a;
  m=a;
  for i =1 : length(a)
      if (n(i,3)>0)
         n(i,1)=1;
         n(i,3)=n(i,3)-1;
      end
      if (n(i,2)+1> (max(s1)))
          n(i,2)=(max(s1));
      else 
      
      n(i,2)=n(i,2)+1;
      end
  end
  n
 
  for i =1 : length(a)
      if (m(i,4)>0)
         m(i,2)=1;
         m(i,4)=m(i,4)-1;
      end
      if (m(i,1)+1> (max(s1)))
          m(i,1)=(max(s1));
      else 
      
      m(i,1)=m(i,1)+1;
      end
  end
  m
  
    v=[];
  for i=1 : length(n)
      for j=1 : length(a)
  if (n(i,:)==a(j,:))
      v=[v;j];
  end
      end
  end
 v
  w=[];
  for i=1 : length(m)
      for j=1 : length(a)
  if (m(i,:)==a(j,:))
      w=[w;j];
  end
      end
  end
w
  p1=x;
  for i = 1 : length(v)
      p1(i,v(i))=1;
  end
p1
  p2=x;
   for i = 1 : length(w)
      p2(i,w(i))=1;
   end

 p2