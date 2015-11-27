function T = loadPrimitive(fileName,nJoints)

M = csvread(fileName);
T = zeros(nJoints,length(M)/nJoints);
for i=1:nJoints
    T(i,:) = M(i:nJoints:end);
    %figure
    %plot(T(i,:))    
	
end
