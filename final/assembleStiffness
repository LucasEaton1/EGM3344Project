function K = assembleStiffness(frame)

K = zeros(frame.nDOF);

for e = 1:frame.nElem %for every member
    kGlobal = elementStiffness(frame, e); %get the 6x6 stiffness matrix for each member
    [~, ~, ~, dofs] = elementGeometry(frame, e); %take only the dofs, we don't need Le, s, or c
    K(dofs, dofs) = K(dofs, dofs) + kGlobal; %take the 6x6 block of K, add this members 6x6 matrix to it, put the results back
end
end
