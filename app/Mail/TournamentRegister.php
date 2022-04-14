<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class TournamentRegister extends Mailable{

	use Queueable, SerializesModels;

	public $data;

	/**
	 * Create a new message instance.
	 *
	 * @return void
	 */
	public function __construct($data){

		$this->data = $data;
	}

	/**
	 * Build the message.
	 *
	 * @return $this
	 */
	public function build(){

		if(!$this->data['registered']){

			return $this->view('mail.tournament-register-invitation', [
				'tournament' => $this->data['tournament']
			]);
		}

		return $this->view('mail.tournament-register', [
			'tournament' => $this->data['tournament']
		]);
	}
}
