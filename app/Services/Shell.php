<?php

namespace App\Services;

use Symfony\Component\Process\Process;

class Shell
{
    public function execute(string $command)
    {
        $process = new Process(explode(' ', $command));

        $process->mustRun();

        return $process->getOutput();
    }
}