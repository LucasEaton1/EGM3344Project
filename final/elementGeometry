function [Le, c, s, dofs] = elementGeometry(frame, e)

n1 = frame.elements(e, 1); %look in row e column 1 (gives start node) (e is a placeholder)
n2 = frame.elements(e, 2); %look in row e column 2 (gives end node)


%take your element and find the x and y coordinates of the start and end
%nodes
x1 = frame.nodes(n1, 1); %row number = node number, column 1 is x, column 2 is y
y1 = frame.nodes(n1, 2);
x2 = frame.nodes(n2, 1);
y2 = frame.nodes(n2, 2);

%length
dx = x2 - x1;
dy = y2 - y1;
Le = sqrt(dx^2 + dy^2);

%directions as sin and cosine
c = dx/Le;
s = dy/Le;

dofs = [3*n1-2, 3*n1-1, 3*n1, 3*n2-2, 3*n2-1, 3*n2];
%makes a table that includes the node, x, y, and rotation
%ex: node 1, x->1, y->2, rot->3
end
