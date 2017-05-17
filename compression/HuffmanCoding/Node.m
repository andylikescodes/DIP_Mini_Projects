classdef Node < handle
    properties
        leftrightchild;
        leftnode;
        rightnode;
        value;
        p;
        leaf = false;
    end
end