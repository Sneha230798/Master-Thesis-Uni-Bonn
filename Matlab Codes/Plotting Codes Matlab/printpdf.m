function [filename] =  printpdf(fig, name, wo)
% printpdf Prints image in PDF format without tons of white space

% The width and height of the figure are found
% The paper is set to be the same width and height as the figure
% The figure's bottom left corner is lined up with
% the paper's bottom left corner

% Set figure and paper to use the same unit
% set(fig, 'Units', 'centimeters')
% set(fig, 'PaperUnits','centimeters');
fig.Units='centimeters';
fig.PaperUnits='centimeters';

% Position of figure is of form [left bottom width height]
% We only care about width and height
pos = get(fig,'Position');

% Set paper size to be same as figure size
% set(fig, 'PaperSize', [pos(3) pos(4)]);
fig.PaperSize=[pos(3) pos(4)];

% Set figure to start at bottom left of paper
% This ensures that figure and paper will match up in size

fig.PaperPositionMode='manual';
fig.PaperPosition=[0 0 pos(3) pos(4)];

% set(fig, 'PaperPositionMode', 'manual');
% set(fig, 'PaperPosition', [0 0 pos(3) pos(4)]);

% Print as pdf
if wo==0
print(fig, '-dpdf', name)

% Return full file name
filename = [name, '.pdf'];

elseif wo==1
    name= strcat(name,'_wo');
print(fig, '-dpdf', name)
filename = [name, '.pdf']
end
end