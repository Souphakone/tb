<?php

require_once "model/DB.php";

use \PHPUnit\Framework\TestCase;

/**
 * @covers DB
 */
class DBTest extends TestCase
{
    /**
     * @covers ::selectOne
     */
    public function testSelectOne(){
        $res = DB::selectOne("SELECT name FROM members WHERE name = :name",["name"=>"Anthony"]);
        $this->assertSame($res['name'], 'Anthony');
    }

    /**
     * @covers ::selectMany
     */
    public function testSelectMany(){
        $res = DB::selectMany("SELECT id, name FROM members ORDER BY id ASC LIMIT 2", []);
        $this->assertSame($res[0], ['id'=> '1', 'name' => 'Anthony']);
        $this->assertSame($res[1], ['id'=> '2', 'name' => 'Armand']);
    }

    /**
     * @covers ::insert
     * @depends testSelectOne
     */
    public function testInsert(){
        // to not hardcode the id of the last member
        $selectLast= DB::selectOne("SELECT id FROM members ORDER BY id DESC LIMIT 1", []);
        $currentLastId = intval($selectLast['id']);

        $res = DB::insert("INSERT INTO members (name, password, role_id) VALUES (:name, :password, :role_id)",
            ["name" => "test", "password" => "test'sPa$$0rd", "role_id"=>'1']);
        $this->assertSame(intval($res), $currentLastId+1);
    }

    /**
     * @covers ::execute
     */
    public function testExecute(){
        $res = DB::execute("UPDATE teams SET name = 'Sans Cardio FC' WHERE id = :id", ['id' => 1]);
        $this->assertTrue($res);
    }

}