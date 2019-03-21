function [] = makeDotPlot(window,treshold,varargin)
    if length(varargin)==4
        readManually(window,treshold,varargin{1,1},varargin{1,2},varargin{1,3},varargin{1,4});
    else if length(varargin)==8
         readFromFile(window,treshold,varargin{1,1},varargin{1,2},varargin{1,3},...
         varargin{1,4},varargin{1,5},varargin{1,6},varargin{1,7},varargin{1,8})
    else if length(varargin)<4 
            error('Podano zbyt malo argumentow wejsciowych')
        else
            error('Podano zbyt duzo argumentow wejsciowych')
       end
        end
    end
end