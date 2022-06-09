function [S2, ma_err, sess_ma_idx, ob_ma_idx, mi_err, sess_mi_idx, ob_mi_idx]=w_series_generic_calc_rmse(Y2, Yh2, n_out)
  
    E2f(:, :, :) = (Y2(1:n_out, :, :) - Yh2(1:n_out, :, :)).^2;
    [skf, sjf, sif] = size(E2f);
    S2 = sum(E2f, 'all');
    Sn2 = skf*sjf*sif;
    
    S2 = sqrt(S2/Sn2);

    [m, i] = max(E2f);
    [ma_err, sess_ma_idx]=max(m);
    ob_ma_idx = i(sess_ma_idx);

    [m, i] = min(E2f);
    [mi_err, sess_mi_idx]=max(m);
    ob_mi_idx = i(sess_mi_idx);
end