#!/bin/bash

show_progress_bar() {
    local bar="■□□□□□□□□□"
    for i in {1..10}; do
        printf "\r${BLUE}[%-10s] %d%%${RESET}" "$bar" "$((i * 10))"
        bar=${bar/□/■}
        sleep 0.2
    done
    echo
}
