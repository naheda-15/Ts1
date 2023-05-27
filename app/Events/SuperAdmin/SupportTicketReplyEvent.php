<?php

namespace App\Events\SuperAdmin;

use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use App\Models\SuperAdmin\SupportTicketReply;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class SupportTicketReplyEvent
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $ticketReply;
    public $notifyUser;

    public function __construct(SupportTicketReply $ticketReply, $notifyUser)
    {
        $this->ticketReply = $ticketReply;
        $this->notifyUser = $notifyUser;
    }

}
