<?php

require_once 'Model.php';

class Role extends Model
{
    public ?int $id = null;
    public ?string $slug = null;
    public ?string $name = null;

    static function make(array $params): Role
    {
        $r = new Role();
        $r->name = $params['name'];
        $r->slug = $params['slug'];
        return $r;
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


    static function find(int $id): ?Role
    {
        $arr = parent::select($id);
        $r = new
            Role();

        if (empty($arr)) {
            return null;
        }
        $r->name = $arr['name'];
        $r->slug = $arr['slug'];
        $r->id = $id;
        return $r;
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
