classdef Huffman < handle
    properties
        %% Properties:
        % image = the original image
        % codec = the huffman code dictionary for the original image
        % tree = the tree built from the original image
        % codemap = the huffman code generated using the dictionary, use
        % this for decoding
        image = [];
        codec = containers.Map('KeyType','int32','ValueType','any');
        tree = [];
        codemap = [];
    end
    methods        
        function obj = Huffman(image)
            obj.image = image;
            p_list = obj.calprob();
            obj.tree = Tree(p_list);
            obj.loop(obj.tree.top, []);
            obj.codemap = obj.buildcodemap();
        end
    
        function I = decode(obj, codemap)
            %% A function to decode a huffman code
            % input:
            %   codemap = a huffman code generated from the huffman coding
            %   object
            % output:
            %   I = the original image after decoding
            
            
            keys = obj.codec.keys();
            disp('decoding');
            for i = 1:length(codemap)
                disp('line:');
                disp(i);
                i_m = i;
                i_n = 1;
                current = 1;
                row = codemap{i};

                while current <= length(row)
                    for j = 1:length(keys)
                        key = keys{j};
                        code = obj.codec(key);
                        
                        if length(row) - current +1 >= length(code)
                            
                            compare = row(current:current+length(code)-1) == code;
                            if all(compare) == true
                                I(i_m,i_n) = key;
                                
                                i_n=i_n+1;
              
                                break;
                            end
                        end

                    end
                    
                    
                    current = current + length(code);
                    
                    
                end
                
            end

        end
    end
    
    
    methods (Access = private)
        
        function p_list = calprob(obj)
            %% A function to calculate the probability of each intensity from the input image
            % input:
            %   none
            % output:
            %   p_list = a list of probability for each index. One index
            %   for one intensity
            
            y = zeros(1,256);
            for i=1:256
                y(i) = sum(sum((obj.image+1) == i));
            end
            p_list = y./(256^2);
        end
        
        function loop(obj, node, codehist)
            %% An recursive function to do binary traverse on the tree and build the huffman code dictionary
            % input:
            %   node = the top node of a tree, where the travesal starts
            %   codehist = a list to record the left and right position
            %   (1,0) in each resursion
            
            if node.leaf == true
                codehist = [codehist, node.leftrightchild];
                obj.codec(int32(node.value)) = codehist;
                
                return
            end
            temphist = [codehist, node.leftrightchild];
            obj.loop(node.leftnode, temphist);
            obj.loop(node.rightnode, temphist);
            
        end
        
        function codemap = buildcodemap(obj)
            %% A function to build a huffman code from the original image using the dictionary
            % output:
            %   codemap = the huffman code generated from the original
            %   image using the 
            [m,n] = size(obj.image);
            for i=1:m
                rowcode = [];
                for j=1:n
                    key = int32(obj.image(i,j));
                    if obj.codec.isKey(key)
                        for k=1:length(obj.codec(key))
                            code = obj.codec(key);
                            rowcode = [rowcode, code(k)];
                        end
                    else
                    end
                end
                codemap{i} = rowcode;
            end
        end
    end
end