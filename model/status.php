<?php

require_once 'Model.php';

class  Statu extends Model
{
    public int $id;
    public string $slug;
    public string $name;

    static function make(array $params): Statu
    {
        $s = new Statu();
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


    static function find(int $id): ?Statu
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
