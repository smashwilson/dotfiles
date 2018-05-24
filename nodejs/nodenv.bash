#!/bin/bash
#
# Load nodenv into the shell if present.

has nodenv && {
  eval "$(nodenv init -)"
}
