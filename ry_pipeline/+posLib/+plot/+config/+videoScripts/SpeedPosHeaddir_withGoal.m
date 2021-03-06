% Speed Pos and Headdir with Goal

headVec = struct('type',  'vector',...
                'field1', 'actual_position', 'x', 1, ...
                'field2','actual_position' , 'y', 2, ...
                'field3', 'headVec',...
               'u', 1, 'scale', {{1}},...
               'varargin',...
    {{'color','green',...
    'linewidth',1,...
    'linestyle','-',...
    'marker','o',...
    'markersize',4}});

headVecDec = struct('type',  'vector',...
                'field1', 'actual_position',   'x', 1, ...
                'field2','actual_position' , 'y', 2, ...
                'field3', 'predict_head_direction',...
               'theta', 1, 'scale', {{10}}, ...
               'thetaShift', pi/2, ...
               'varargin',...
    {{'color','green',...
    'linewidth',2,...
    'linestyle',':',...
    'marker','o',...
    'markersize',4}});

headVecDec2 = struct('type',  'vector',...
                'field1', 'predict_position',   'x', 1, ...
                'field2','predict_position' , 'y', 2, ...
                'field3', 'predict_head_direction',...
               'theta', 1, 'scale', {{10}}, ...
               'thetaShift', pi/2, ...
               'varargin',...
    {{'color','green',...
    'linewidth',0.5,...
    'linestyle',':',...
    'marker','o',...
    'markersize',4}});

decode.predict_pos_dist = [decode.predict_position(:,1)   - decode.actual_position(:,1),...
                           decode.predict_position(:,2) - decode.actual_position(:,2)];
posDecodeVec = struct('type',  'point',...
                ...'field1', 'actual_position',    'x', 1, ...
                ...'field2', 'actual_position' , 'y', 2, ...
                'field3', 'predict_position',    'x', 1, ...
                'field4', 'predict_position' ,   'y', 2, ...
               'varargin',...
    {{'color','red',...
    'markeredgecolor','white',...
    'markerfacecolor','red',...
    'linewidth',3,...
    'linestyle',':',...
    'marker','o',...
    'markersize',8}});
%posDec = struct('type',  'point',...
%                'field1', 'predict_position', 'x', 1, ...
%                'field2', 'predict_position_y' , 'y', 1, ...
%               'varargin',...
%    {{'color','red',...
%    'linewidth',3,...
%    'linestyle',':',...
%    'marker','o',...
%    'markersize',4}});

speed = struct('type',  'magnitudeAx',...
               'field1', 'actual_speed',...
               'val', 1, 'maxval',{{40}},...
               'varargin',...
    {{'color','cmap',...
    }});
speedDec = struct('type',  'magnitudeAx_line',...
               'field1', 'predict_speed',...
               'val', 1,...
               'varargin',...
    {{'color','black',...
    'linewidth',3,...
    'linestyle',':',...
    'marker','o',...
    'markersize',4}});
goalVec = struct('type',  'vector',...
               'field1', 'pos',...
               'x', 1, 'y', 2, ...
               'field2', 'currentGoalVec',...
               'u', 1, 'scale', {{1}}, ...
               'varargin', ...
    {{'color',[0 1 1],...
    'LineWidth',2.5,...
    'LineStyle',':',...
    'Marker','o',...
    'MarkerSize',4}});

%decode.predict_stopwell_round = ceil(decode.predict_stopwell);
%S = decode.predict_stopwell;
%N = nan(size(S));
%["actual", "predict", "loss"]filt = S >= 4.2 & S <= 6;
%S(filt) = 5; N(filt) = 1;
%filt = S >= 3.5 & S <= 4.2;
%S(filt) = 4; N(filt) = 1;
%filt = S >= 2.6 & S <= 3.2;
%S(filt) = 3; N(filt) = 1;
%filt = S >= 1.6 & S <= 2.3;
%S(filt) = 2; N(filt) = 1;
%filt = S >= 0.6 & S <= 1.4;
%S(filt) = 2; N(filt) = 1;
%S = S .* N;
%decode.predict_stopwell_round = S;
colors = cmocean('phase',6);
goalGridState = struct('type', 'gridState',...
    'field1', 'predict_stopwell', 'state', 2:size(decode.predict_stopwell,2),...
    'field2', 'gridTable', 'gridTable', 1,...
    'possibleStates', 1:5,...
    'thresh', 0.3,...
    'colors', colors(2:6,:),...
'varargin',{{'linewidth',0}});

instructions = {posDecodeVec, goalVec, headVec, headVecDec, goalGridState};
