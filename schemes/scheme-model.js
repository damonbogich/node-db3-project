const db = require("../data/db-config");

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
}
function find() {
    return db("schemes");
}

function findById(id) {
    return db("schemes")
    .where({id})
    .first()
}

function findSteps(id) {
    return db("steps as s")
    .join("schemes as sch", "s.scheme_id", "sch.id")
    .select("sch.scheme_name", "s.step_number", "s.instructions")
    .where("scheme_id", id)
    .orderBy("s.step_number", "asc")
}

function add(scheme) {
    return db("schemes")
    .insert(scheme, "id")
        
}

function update(changes, id) {
    return db("schemes")
    .where({id})
    .update(changes, id)

}

function remove(id) {
    return db("schemes")
    .where({id})
    .del()
};


