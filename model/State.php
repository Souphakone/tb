<?php

require_once 'Model.php';

class  State extends Model
{
    public ?int $id = null;
    public ?string $slug = null;
    public ?string $name = null;

    static function make(array $params): State
    {
        $s = new State();
        $s->name = $params['name'];
        $s->slug = $params['slug'];
        return $s;
    }

    public function create(): bool
    {
        $this->id = parent::insert(['slug' => $this->slug, 'name' => $this->name]);
        return $this->id;
    }

    public function save(): bool
    {
        $array = ['slug' => $this->slug, 'name' => $this->name];
        return parent::update($this->id, $array);
    }


    static function find(int $id): ?State
    {
        $arr = parent::select($id);
        $s = new
        Role();

        if (empty($arr)) {
            return null;
        }
        $s->name = $arr['name'];
        $s->slug = $arr['slug'];
        $s->id = $id;
        return $s;
    }

    public function delete(): bool
    {
        if (isset($this->id)) {
            return parent::destroy($this->id);
        } else {
            return false;
        }
    }


}