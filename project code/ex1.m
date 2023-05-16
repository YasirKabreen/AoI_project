clc,clear 

% The state variable are [AoI , B_level , w_ch_state].
AoI1=[1 2  ]; 
AoI2=[1 2 ] ;
B_level_1=[ 1 2 ];  
B_level_2=[ 1 2 ]; 



  StateSpace=[];
  for i=1 : length(AoI1)
      for j=1 : length(AoI2)
          for k=1 : length(B_level_1)
              for l=1 : length(B_level_2)
      StateSpace=[StateSpace;[AoI1(i),AoI2(j),B_level_1(k),B_level_2(l)]];
               end
          end
      end
  end
  
StateSpace
    x=zeros(length(StateSpace),length(StateSpace));
    
  % when the first Sensor is sending.
  n=StateSpace;
  n1=[];
  n2=[];
  
  for i =1 : length(StateSpace)
    
         n(i,1)=1;
      n(i,2)= min(n(i,2)+1,max(AoI2));
      if(n(i,3)==1)
           n1=[n1;n(i,:)];
      else
          n2=[n2;n(i,:)];
      end
  end

  n
  n1 
  n2
  % when the second Sensor is sending
 m=StateSpace;
  for i =1 : length(StateSpace)
     
         m(i,2)=1;
      
      m(i,1)= min(m(i,1)+1,max(AoI1));
  end
  
m
  
    v1=[];
    v2=[];
  for i=1 : length(n1)
      for j=1 : length(StateSpace)
  if (n1(i,:)==StateSpace(j,:))
      v1=[v1;j];
  end
  if (n2(i,:)==StateSpace(j,:))
      v2=[v2;j];
  end
      end
  end
  v1
  v2
 
  w=[];
  for i=1 : length(m)
      for j=1 : length(StateSpace)
  if (m(i,:)==StateSpace(j,:))
      w=[w;j];
  end
      end
  end

  p1=x;
  for i = 1 : length(v)
      p1(i,v(i))=1;
  end

  p2=x;
   for i = 1 : length(w)
      p2(i,w(i))=1;
   end

 
 
 
 
 MDPtoolbox_path = pwd;
addpath(MDPtoolbox_path)
P(:,:,1) = p1;
P(:,:,2) = p2;
 R(:,1) =-n(:,2)'  ;
R(:,2) =-m(:,1)' ;

mdp_check(P, R)

discount = 0.95;
[V, policy] = mdp_policy_iteration(P, R, discount)
figure(3)
plot(policy)
axis([0 100 0 3])

