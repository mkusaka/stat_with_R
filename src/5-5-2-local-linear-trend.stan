data {
  int T;
  vector[T] y;
}

parameters {
  vector[T] mu;
  vector[T] delta;
  real<lower=0> s_w;
  real<lower=0> s_z;
  real<lower=0> s_v;
}

model {
  s_w ~ normal(2, 2);
  s_z ~ normal(0.5, 0.5);
  s_v ~ normal(10, 5);
  for(i in 2:T) {
    mu[i] ~ normal(mu[i-1] + delta[i-1], s_w);
    delta[i] ~ normal(delta[i-1], s_z);
  }
  for(i in 1:T) {
    y[i] ~ normal(mu[i], s_v);
  }
}
