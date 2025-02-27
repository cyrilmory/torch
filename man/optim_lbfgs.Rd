% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/optim-lbfgs.R
\name{optim_lbfgs}
\alias{optim_lbfgs}
\title{LBFGS optimizer}
\usage{
optim_lbfgs(
  params,
  lr = 1,
  max_iter = 20,
  max_eval = NULL,
  tolerance_grad = 1e-07,
  tolerance_change = 1e-09,
  history_size = 100,
  line_search_fn = NULL
)
}
\arguments{
\item{params}{(iterable): iterable of parameters to optimize or dicts defining
parameter groups}

\item{lr}{(float): learning rate (default: 1)}

\item{max_iter}{(int): maximal number of iterations per optimization step
(default: 20)}

\item{max_eval}{(int): maximal number of function evaluations per optimization
step (default: max_iter * 1.25).}

\item{tolerance_grad}{(float): termination tolerance on first order optimality
(default: 1e-5).}

\item{tolerance_change}{(float): termination tolerance on function
value/parameter changes (default: 1e-9).}

\item{history_size}{(int): update history size (default: 100).}

\item{line_search_fn}{(str): either 'strong_wolfe' or None (default: None).}
}
\description{
Implements L-BFGS algorithm, heavily inspired by
\href{https://www.cs.ubc.ca/~schmidtm/Software/minFunc.html}{minFunc}
}
\note{
This is a very memory intensive optimizer (it requires additional
\code{param_bytes * (history_size + 1)} bytes). If it doesn't fit in memory
try reducing the history size, or use a different algorithm.
}
\section{Warning}{


This optimizer doesn't support per-parameter options and parameter
groups (there can be only one).

Right now all parameters have to be on a single device. This will be
improved in the future.

If you need to move a model to GPU via \verb{$cuda()}, please do so before
constructing optimizers for it. Parameters of a model after \verb{$cuda()}
will be different objects from those before the call. In general, you
should make sure that the objects pointed to by model parameters subject
to optimization remain the same over the whole lifecycle of optimizer
creation and usage.
}

