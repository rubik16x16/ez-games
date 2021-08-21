<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class TestCron extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'testcron';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Test cron';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle(){

        file_put_contents('/home/rubik16x16/Projects/ez-games/test.txt', 'a', FILE_APPEND);
        return 0;
    }
}
