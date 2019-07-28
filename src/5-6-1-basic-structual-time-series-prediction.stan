data {
  int T;
  int pred_term;
  vector[T] y;
}

parameters {
  vector[T] mu;
  vector[T] gamma;
  real<lower=0> s_z;
  real<lower=0> s_v;
  real<lower=0> s_s;
}

transformed parameters {
  vector[T] alpha;
  for(i in 1:T) {
    alpha[i] = mu[i] + gamma[i];
  }
}

model {
  for(i in 3:T) {
    mu[i] ~ normal(2 * mu[i-1] - mu[i-2], s_z);
  }
  for(i in 7:T) {
    gamma[i] ~ normal(-sum(gamma[(i - 6):(i - 1)]), s_s);
  }
  for(i in 1:T) {
    y[i] ~ normal(alpha[i], s_v);
  }
}

generated quantities {
  vector[T + pred_term] mu_pred;
  vector[T + pred_term] gamma_pred;
  vector[pred_term] y_pred;
  mu_pred[1:T] = mu;
  gamma_pred[1:T] = gamma;
  for (i in 1:pred_term) {
    mu_pred[T + i] = normal_rng(mu_pred[T + i - 1], s_z);
    gamma_pred[i] = normal_rng(-sum(gamma_pred[(T + i - 6):(T + i - 1)]), s_s);
    y_pred[i] = normal_rng(mu_pred[T + i] + gamma_pred[T + i], s_v);
  }
}
