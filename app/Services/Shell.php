<?php

namespace App\Services;

use Symfony\Component\Process\Process;

class Shell
{
    public function execute(string $command)
    {
        $process = new Process(explode(' ', $command));

        $process->mustRun();

        var_dump($process->getOutput());
        return $process->getOutput();
    }
}