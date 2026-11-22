function F = buildLoadVector(frame)

F = zeros(frame.nDOF, 1); %column of 27 zeros, one slot per DOF

for e = frame.loadedElements %loop only over loaded elements
    [Le, c, s, dofs] = elementGeometry(frame, e); %length direction and 6 dof slots
    [~, T] = elementStiffness(frame, e); %we just need T to rotate and translate later
    x1 = frame.nodes(frame.elements(e, 1), 1); %global x coordinates of each beams start node
    wAt = @(xa) frame.wfunc(x1 + c*xa); %plug in a distance it gives back the load
    qx = @(xa) - wAt(xa) * s; %load along the beam
    qy = @(xa) - wAt(xa) * c; %load across the beam

    %shape functions
    N1 = @(xa) 1 - 3*(xa/Le).^2 + 2*(xa/Le).^3;
    N2 = @(xa) xa - 2*xa.^2/Le + xa.^3/Le^2;
    N3 = @(xa) 3*(xa/Le).^2 - 2*(xa/Le).^3;
    N4 = @(xa) -xa.^2/Le + xa.^3/Le^2;

    fLocal = zeros(6, 1);
    fLocal(1) = integral(@(xa) qx(xa) .* (1-xa/Le), 0, Le); %force along at the starting node
    fLocal(2) = integral(@(xa) qy(xa) .* N1(xa), 0, Le); %force across at the starting node
    fLocal(3) = integral(@(xa) qy(xa) .* N2(xa), 0, Le); %moment at starting node
    fLocal(4) = integral(@(xa) qx(xa) .* (xa/Le), 0, Le); %force along at the end node
    fLocal(5) = integral(@(xa) qy(xa) .* N3(xa), 0, Le); %force across at the end node
    fLocal(6) = integral(@(xa) qy(xa) .* N4(xa), 0, Le); %moment at the end node

    F(dofs) = F(dofs) + T' * fLocal; %convert to global axes
end
end
