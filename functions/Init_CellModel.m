%%%%%%%%%%% Initialized the CellModel %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Auther: Fan
% Date: March 2015
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function CellParam = Init_CellModel(temp,model)
    CellParam.eta = getParamESC('etaParam',temp,model);
    CellParam.M   = getParamESC('MParam',temp,model);
    CellParam.M0  = getParamESC('M0Param',temp,model);
    CellParam.R0  = getParamESC('R0Param',temp,model);
    CellParam.R1  = getParamESC('RParam',temp,model);
    CellParam.RC  = getParamESC('RCParam',temp,model);
    CellParam.hg  = getParamESC('GParam',temp,model);
    CellParam.Q   = getParamESC('QParam',temp,model);
    CellParam.Ti  = 1;
% 
%     CellParam.tab_V = table_V;
%     CellParam.tab_z = table_z;
%     CellParam.tab_dVdz = table_dVdz;
    
    CellParam.tab_z = [0:0.001:1];
    CellParam.tab_V = OCVfromSOCtemp(CellParam.tab_z,temp,model);

    CellParam.tab_Vi = [2.4:0.01:4.1];
    CellParam.tab_zi = OCVfromSOCtemp(CellParam.tab_Vi,temp,model);
end