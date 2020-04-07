function [distY, distU, distV] = computeHistogramMetric(degPC, refPC, type, A)
%computeHistogramMetric compute distance between histograms of degraded
%point cloud and reference 
%   Usage: [distY, distU, distV] = computeHistogramMetric(degPC, refPC, type, A)
% 
% 
%   Input parameters
%       degPC   = color attributes of the degraded point cloud content,
%                 size N-by-3. N is the number of points in the point cloud
%       refPC   = color attributes of the reference point cloud content,
%                 size M-by-3. M is the number of points in the point cloud
%       type    = distance metric to be applied (default = 'euclidean')
%       A       = optional; for quadratic distance, matrix to be used to
%                 compute the distance 
%
%
%   Output parameters
%       [distY, distU, distV] = distance for the 3 color channels
%
%   The function computes the distance between the histograms of the degraded
%   point cloud content with respect to the undegraded reference point cloud 
%   content. The type of distance to be used is given as a parameter to the 
%   function; if omitted, the default is the Euclidean distance.

% Copyright (c) Irene Viola, Shishir Subramanyam, Pablo Cesar.
% Centrum Wiskunde & Informatica (CWI).
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

% If you use this software please kindly cite
%     I. Viola, S. Subramanyam, and P. Cesar.
%     "A color-based objective quality metric for point cloud contents"
%     2020 Twelfth International Conference on Quality of Multimedia 
%     Experience (QoMEX). IEEE, 2020.

if nargin < 3
    type = 'euclidean';
end

if nargin < 4 && strcmp(type, 'quadratic')
    error('For quadratic metric, matrix A must be specified');
end

f = imhist(degPC(:,1));
countsDY = f'/sum(f);
f = imhist(refPC(:,1));
countsRY = f'/sum(f);

f = imhist(degPC(:,2));
countsDU = f'/sum(f);
f = imhist(refPC(:,2));
countsRU = f'/sum(f);

f = imhist(degPC(:,3));
countsDV = f'/sum(f);
f = imhist(refPC(:,3));
countsRV = f'/sum(f);


if strcmp(type, 'quadratic')
    distY=real(sqrt((countsDY'-countsRY')'*A*(countsDY'-countsRY')));
    distU=real(sqrt((countsDU'-countsRU')'*A*(countsDU'-countsRU')));
    distV=real(sqrt((countsDV'-countsRV')'*A*(countsDV'-countsRV')));
else
    distY = pdist2(countsDY, countsRY, type);
    distU = pdist2(countsDU, countsRU, type);
    distV = pdist2(countsDV, countsRV, type);
end

end