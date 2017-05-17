classdef Tree < handle
    properties
        top = [];
        n_nodes = 0;
        nodes = [];
    end
    methods
        function obj = Tree(p_list)
            %% Tree constructor
            % input:
            %   p_list: the probability list generated from the histogrm of
            %   image
            % output:
            %       A tree object
            leaves = obj.treeleaves(p_list);
            obj.nodes = obj.treenodes(leaves);
           
        end
    end
    
    methods (Access=private)
        function leaves = treeleaves(obj, p_list)
            %% Generate the tree leaf nodes
            % input:
            %   p_list = the probability list generated from the histogram
            %   of the image
            % ouput:
            %   leaves = the leaves of the tree
            leaves=[];
            for i=1:length(p_list)
                if p_list(i) ~= 0
                    newnode = Node();
                    newnode.p = p_list(i);
                    newnode.value = i-1;
                    newnode.leaf = true;
                    leaves = [leaves, newnode];
                end
            end
           
        end
        
        function nodes = treenodes(obj, leaves)
            %% Generate the nodes of a tree
            % input:
            %   leaves = the leaves of a tree
            % output:
            %   nodes = all the nodes including the leaves
            
            nodes = leaves;    
            while (1)
                if length(leaves) <= 1
                    obj.top = leaves(1);
                    break
                end
                %find the 2 nodes with the smallest probability
                [sinx, snodes] = obj.findlowest2ps(leaves);
                newnode = Node;
                
                %break the loop while the new node is probability 1
                if newnode.p >= 1
                    break;
                end
                
                %assign probability to the new node with the sumation of
                %the left and right nodes
                newnode.p = snodes(1).p + snodes(2).p;
                
                %set the left and right node for the new node
                newnode.leftnode = snodes(1);
                newnode.rightnode = snodes(2);
                
                %add the new node to the list
                nodes = [nodes, newnode];
                
                %set left child as 1, right child as 0
                snodes(1).leftrightchild = 1;
                snodes(2).leftrightchild = 0;
                
                %remove the two child from the leave list for next
                %iteration
                leaves(sinx(1))=[];
                leaves(sinx(2))=[];
                leaves = [leaves, newnode];
                
                
            end
            
            
        end
        
        function [lowest2ps_inx, lowest2ps_nodes] = findlowest2ps(obj, nodes)
            %% find the two nodes containing the smallest probabilities
            % input:
            %   nodes = the nodes from a tree
            % output:
            %   lowest2ps_inx = a list containing the index of the two
            %                   nodes with the smallest probability
            %   lowest2ps_nodes = a list containing the nodes of with the
            %   two smallest probability
            [lowestp_inx, lowestp_node] = obj.findlowestp(nodes);
            nodes(lowestp_inx)=[];
            [lowestp_inx2, lowestp_node2] = obj.findlowestp(nodes);
            
            lowest2ps_inx = [lowestp_inx, lowestp_inx2];
            lowest2ps_nodes = [lowestp_node, lowestp_node2];
           
        end
        
        function [lowestp_inx, lowestp_node] = findlowestp(obj, nodes)
            %% A utility function of finding the nodes with the smallest
            % probability
            lowestp_node = nodes(1);
            lowestp_inx = 1;
            for i=1:length(nodes)
                if nodes(i).p < lowestp_node.p
                    lowestp_node = nodes(i);
                    lowestp_inx = i;
                end
            end
        end
    end
end