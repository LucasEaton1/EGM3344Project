function [Kff, Ff, freeDOF] = applyBoundaryConditions(K, F, frame)
%Kff is the reduced stiffness matrix
%Ff is the reduced load vector
%freeDOF is the list of slots we keep

fixedDOF = [];

for r = 1:size(frame.supports, 1)
    n = frame.supports(r, 1); %node number
    nodeDOF = [3*n-2, 3*n-1, 3*n]; %x, y, and rot slots
    
    isFixed = frame.supports(r, 2:4) == 1; %if 1, true (the value is fixed)

    fixedDOF = [fixedDOF, nodeDOF(isFixed)]; %keep only the fixed values
end

freeDOF = setdiff(1:frame.nDOF, fixedDOF); %everything in frame.nDOF that is not fixed

Kff = K(freeDOF, freeDOF);
Ff = F(freeDOF);
end
