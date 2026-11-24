function [kGlobal, T, kLocal] = elementStiffness(frame, e)

[Le, c, s] = elementGeometry(frame, e);
E = frame.E;
A = frame.A;
I = frame.I;

a = E*A/Le; %stretching stiffness
b1 = 12*E*I/Le^3; %bending
b2 = 6*E*I/Le^2; %bending
b3 = 4*E*I/Le; %bending
b4 = 2*E*I/Le; %bending

%it goes force at u1, force at v1, moment at theta 1, force at u2, force at
%v2, moment at theta 2
kLocal = [a 0 0 -a 0 0; 0 b1 b2 0 -b1 b2; 0 b2 b3 0 -b2 b4; -a 0 0 a 0 0; 0 -b1 -b2 0 b1 -b2; 0 b2 b4 0 -b2 b3];

%converting one nodes global movements into local movements
R = [c s 0; -s c 0; 0 0 1];

%now doing it for both ends (6x6)
T = [R zeros(3); zeros(3) R];

kGlobal = T' * kLocal * T;
end

%global movements to local movements to local forces to global forces
