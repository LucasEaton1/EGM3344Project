function frame = frameInput()

frame.nodes = [0 0; 6 0; 12 0; 0 4; 6 4; 12 4; 0 8; 6 8; 12 8];
frame.elements = [1 4; 2 5; 3 6; 4 7; 5 8; 6 9; 4 5; 5 6; 7 8; 8 9];

frame.E = 200e9; %young's modulus
frame.A = 9.5e-3; %cross sectional area (m^2)
frame.I = 1.65e-4; %second moment of area

frame.wfunc = @(x) 20e3*sin(pi*x/12); %distributed load
frame.loadedElements = [9 10]; %only members 9 and 10 carry the distributed load

frame.supports = [1 1 1 1; 2 1 1 1; 3 1 1 1]; %node, fix x?, fix y?, fix rotation? 1=yes 0 =no

frame.nNodes = size(frame.nodes, 1); %how many rows does frame.nodes have?
frame.nElem = size(frame.elements, 1); %how many rows does frame.elements?
frame.nDOF = 3 * frame.nNodes;
end
